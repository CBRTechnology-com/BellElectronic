table 50125 "Item Stock Status Information"
{
    Caption = 'Item Stock Status Info';

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item."No.";
        }
        field(2; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
        }
        field(3; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
        }
        field(4; "Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
        }
        field(5; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
        }
        field(6; "Lot No."; Code[20])
        {
            Caption = 'Lot No.';
        }
        field(7; "Qty. (Base)"; Decimal)
        {
            Caption = 'Qty. (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(8; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(9; Description; Text[250])
        {
        }
        field(10; "Expiration Date"; Date)
        {
        }
        field(11; "Warranty Date"; Date)
        {
        }
        field(12; "Qty Available"; Decimal)
        {
        }
        field(13; "Unit Cost"; Decimal)
        {
        }
        field(14; "Unit Price"; Decimal)
        {
        }
        field(15; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
            DataClassification = ToBeClassified;
        }
        field(16; "Alternate Serial Number"; Text[50])
        {
            Caption = 'Alternate Serial Number';
        }
        field(17; "Owner Type"; Option)
        {
            OptionMembers = "BE","Boeing";
            Caption = 'Owner';
        }
        field(18; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = "Saleable","BER","Missing","Rental","Repair","Scrap";
        }
        field(19; "Item Comment"; Text[50])
        {
            Caption = 'Item Comment';
        }
        field(20; "Last Inventoried Date"; Date)
        {
            Caption = 'Last Inventoried Date';
        }
        field(21; "Item Location"; Text[14])
        {
            Caption = 'Item Location';
        }
        field(22; "Manufacturer Name"; Text[50])
        {
            Caption = 'Manufacturer Name';
        }

    }

    keys
    {
        key(Key1; "Item No.", "Variant Code", "Location Code", "Zone Code", "Bin Code", "Lot No.", "Serial No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        ItemFilter: Text;
        ExpirationDate: Date;
        WarrantryDate: Date;
        LastInvDate: Date;
        ShowDialog: Dialog;
        ExpiredQty: Decimal;
        QtyAval: Decimal;
        altSerialNumber: Text[50];
        itemComments: Text[50];
        itemLoc: Text[14];
        Owner: Option;
        StatusType: Option;
        ILEUnitCost: Decimal;



    procedure GetExpirationDate(ItemLot: Query "Item Stock Status Query")
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        ExpirationDate := 0D;
        WarrantryDate := 0D;
        LastInvDate := 0D;
        ILEUnitCost := 0;
        Clear(altSerialNumber);
        Clear(itemComments);
        Clear(Owner);
        Clear(StatusType);
        Clear(itemLoc);

        ItemLedgerEntry.Reset;
        ItemLedgerEntry.SetRange("Item No.", ItemLot.Item_No);
        ItemLedgerEntry.SetRange("Location Code", ItemLot.Location_Code);
        ItemLedgerEntry.SetRange("Serial No.", ItemLot.Serial_No);
        if ItemLedgerEntry.FindFirst then begin
            ExpirationDate := ItemLedgerEntry."Expiration Date";
            WarrantryDate := ItemLedgerEntry."Warranty Date";
            LastInvDate := ItemLedgerEntry."Last Inventoried Date";
            altSerialNumber := ItemLedgerEntry."Alternate Serial Number";
            itemComments := ItemLedgerEntry."Item Comment";
            Owner := ItemLedgerEntry."Owner Type";
            StatusType := ItemLedgerEntry.Status;
            itemLoc := ItemLedgerEntry."Item Location";
            ItemLedgerEntry.CalcFields("Cost Amount (Actual)");
            ILEUnitCost := ItemLedgerEntry."Cost Amount (Actual)";
        end;
    end;

    procedure FillTempTable()
    var
        LotNosByBinCode: Query "Item Stock Status Query";
        Itemrec: Record Item;
        ItemLitWiseStatus: Record "Item Stock Status Information";
    begin
        DeleteAll;
        if ItemFilter <> '' then
            LotNosByBinCode.SetFilter(LotNosByBinCode.Item_No, ItemFilter);
        ShowDialog.Open('Processing data ..');
        LotNosByBinCode.Open;
        while LotNosByBinCode.Read do begin
            ItemLitWiseStatus.Init;
            ItemLitWiseStatus."Item No." := LotNosByBinCode.Item_No;
            ItemLitWiseStatus."Variant Code" := LotNosByBinCode.Variant_Code;
            ItemLitWiseStatus."Location Code" := LotNosByBinCode.Location_Code;
            ItemLitWiseStatus."Lot No." := LotNosByBinCode.Lot_No;
            ItemLitWiseStatus."Serial No." := LotNosByBinCode.Serial_No;
            ItemLitWiseStatus."Quantity" := LotNosByBinCode.Sum_Qty_Base;

            if Itemrec.Get(LotNosByBinCode.Item_No) then begin
                GetExpirationDate(LotNosByBinCode);
                ItemLitWiseStatus."Expiration Date" := ExpirationDate;
                ItemLitWiseStatus."Warranty Date" := WarrantryDate;
                ItemLitWiseStatus.Description := Itemrec.Description;
                if Itemrec."Costing Method" = Itemrec."Costing Method"::Specific then
                    ItemLitWiseStatus."Unit Cost" := Abs(ILEUnitCost)
                else
                    ItemLitWiseStatus."Unit Cost" := Itemrec."Unit Cost";

                ItemLitWiseStatus."Unit Price" := Itemrec."Unit Price";
                ItemLitWiseStatus."Manufacturer Name" := Itemrec."Manufacturer Name";
                ItemLitWiseStatus."Alternate Serial Number" := altSerialNumber;
                ItemLitWiseStatus."Item Comment" := itemComments;
                ItemLitWiseStatus."Owner Type" := Owner;
                ItemLitWiseStatus.Status := StatusType;
                ItemLitWiseStatus."Last Inventoried Date" := LastInvDate;
                ItemLitWiseStatus."Item Location" := itemLoc;
                GetAvalQuantity(LotNosByBinCode.Item_No, ItemLitWiseStatus);//CBR_SS 13.Aug.2018
            end;
            if ItemLitWiseStatus.Insert then;
        end;
        ShowDialog.Close;
    end;

    local procedure GetAvalQuantity(ItemNo: Code[20]; var ItemLitWiseStatus: Record "Item Stock Status Information")
    var
        ItemLoc: Record Item;
    begin
        //CBR_SS 13.Aug.2018 >>
        ItemLoc.Get(ItemNo);
        ItemLoc.CalcFields(Inventory, "Qty. on Sales Order");
        ItemLitWiseStatus."Qty Available" := (ItemLoc.Inventory - ItemLoc."Qty. on Sales Order");
        //CBR_SS 13.Aug.2018 <<
    end;
}

