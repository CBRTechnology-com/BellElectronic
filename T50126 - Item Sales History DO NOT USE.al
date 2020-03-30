table 50126 "Item Sales history"
{

    Caption = 'Item Sales history';

    fields
    {
        field(1; "Invoice No."; Code[20])
        {
            Caption = 'Document No.';
            //TableRelation = "Sales Invoice Header"."No.";
        }
        field(2; "Invoice Date"; Date)
        {
            Caption = 'Doc Date';
        }
        field(3; "Customer No"; Code[20])
        {
            Caption = 'Customer No';
            TableRelation = Customer."No.";
        }
        field(4; "Customer Name"; text[50])
        {
            Caption = 'Customer Name';
        }
        field(5; "External Document No"; Code[35])
        {
            Caption = 'External Document No';
        }
        field(6; "Sales Order No"; Code[20])
        {
            Caption = 'Sales Order No';
            //TableRelation = "Sales Header"."No.";
        }
        field(7; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item."No.";
        }
        field(8; "Item Description"; text[50])
        {
            Caption = 'Item Description';

        }
        field(9; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
        }

        field(10; "Lot No."; Code[20])
        {
            Caption = 'Lot No.';
        }

        field(11; "Model"; text[50])
        {
            Caption = 'Model';
        }

        field(12; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }

        field(13; "Expiration Date"; Date)
        {
        }
        field(14; "Warranty Date"; Date)
        {
        }
        field(15; "Qty Available"; Decimal)
        {
        }
        field(16; "Unit Cost"; Decimal)
        {
        }
        field(17; "Unit Price"; Decimal)
        {
        }
        field(18; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
            DataClassification = ToBeClassified;
        }
        field(19; "Alternate Serial Number"; Text[50])
        {
            Caption = 'Alternate Serial Number';
        }
        field(20; "Owner Type"; Option)
        {
            OptionMembers = "BE","Boeing";
            Caption = 'Owner';
        }
        field(21; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = "Saleable","BER","Missing","Rental","Repair","Scrap";
        }
        field(22; "Item Comment"; Text[50])
        {
            Caption = 'Item Comment';
        }
        field(23; "Last Inventoried Date"; Date)
        {
            Caption = 'Last Inventoried Date';
        }
        field(24; "Item Location"; Text[14])
        {
            Caption = 'Item Location';
        }
        field(25; "Manufacturer Name"; Text[50])
        {
            Caption = 'Manufacturer Name';
        }
        field(26; "Document Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = "Invoice","Shipment";
        }

    }

    keys
    {
        key(Key1; "Invoice No.", "Item No.", "Location Code", "Lot No.", "Serial No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        ItemFilter: Text;
        ShowDialog: Dialog;

    procedure FillTempTable()
    var
        ItemSalesHistoryQuery: Query "Item Sales History";

        Itemrec: Record Item;
        CustomerRec: Record Customer;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        VLE: Record "Value Entry";
        ILE: Record "Item Ledger Entry";
    begin
        //    {
        //     DeleteAll;
        //     if ItemFilter <> '' then
        //         ItemSalesHistoryQuery.SetFilter(ItemSalesHistoryQuery.Item_No_, ItemFilter);
        //     ShowDialog.Open('Processing data ..');
        //     ItemSalesHistoryQuery.Open;
        //     while ItemSalesHistoryQuery.Read do begin
        //         IF SalesInvoiceHeader.get(ItemSalesHistoryQuery.Document_No_) then begin
        //             ItemSalesHistoryRec.Init;
        //             ItemSalesHistoryRec."Invoice No." := SalesInvoiceHeader."No.";
        //             ItemSalesHistoryRec."Item No." := ItemSalesHistoryQuery.Item_No_;
        //             ItemSalesHistoryRec."Customer No" := SalesInvoiceHeader."Sell-to Customer No.";

        //             ItemSalesHistoryRec."Invoice Date" := SalesInvoiceHeader."Posting Date";
        //             ItemSalesHistoryRec."Document Type" := ItemSalesHistoryRec."Document Type"::Invoice;
        //             ItemSalesHistoryRec."Sales Order No" := SalesInvoiceHeader."Order No.";
        //             ItemSalesHistoryRec."External Document No" := SalesInvoiceHeader."External Document No.";


        //             ILE.RESET;
        //             ILE.setrange("Document No.", ItemSalesHistoryQuery.Document_No_);
        //             ILE.setrange("Document Line No.", ItemSalesHistoryQuery.Line_No_);
        //             ILE.setrange("Item No.", ItemSalesHistoryQuery.Item_No_);
        //             if ILE.findfirst then begin
        //                 ItemSalesHistoryRec."Serial No." := ILE."Serial No.";
        //                 ItemSalesHistoryRec."Location Code" := ILE."Location Code";
        //                 ItemSalesHistoryRec."Lot No." := ILE."Lot No.";
        //                 ItemSalesHistoryRec."Expiration Date" := ILE."Expiration Date";
        //                 ItemSalesHistoryRec."Warranty Date" := ILE."Warranty Date";
        //                 ItemSalesHistoryRec."Last Inventoried Date" := ILE."Last Inventoried Date";
        //                 ItemSalesHistoryRec."Alternate Serial Number" := ILE."Alternate Serial Number";
        //                 ItemSalesHistoryRec."Item Comment" := ILE."Item Comment";
        //                 ItemSalesHistoryRec."Owner Type" := ILE."Owner Type";
        //                 ItemSalesHistoryRec.Status := ILE.Status;
        //             end;
        //             if Itemrec.Get(ItemSalesHistoryQuery.Item_No_) then begin
        //                 ItemSalesHistoryRec."Item Description" := Itemrec.Description;
        //                 if Itemrec."Costing Method" = Itemrec."Costing Method"::Specific then begin
        //                     VLE.RESET;
        //                     VLE.setrange("Document No.", ItemSalesHistoryQuery.Document_No_);
        //                     VLE.setrange("Document Line No.", ItemSalesHistoryQuery.Line_No_);
        //                     VLE.setrange("Item No.", ItemSalesHistoryQuery.Item_No_);
        //                     if VLE.findfirst then
        //                         ItemSalesHistoryRec."Unit Cost" := ABS(VLE."Cost Amount (Actual)")
        //                 end else
        //                     ItemSalesHistoryRec."Unit Cost" := Itemrec."Unit Cost";
        //                 ItemSalesHistoryRec."Unit Price" := Itemrec."Unit Price";
        //                 ItemSalesHistoryRec."Manufacturer Name" := Itemrec."Manufacturer Name";
        //                 ItemSalesHistoryRec.Model := Itemrec.Model;
        //             end;
        //         end;
        //         if CustomerRec.get(ItemSalesHistoryQuery.Sell_to_Customer_No_) then
        //             ItemSalesHistoryRec."Customer Name" := CustomerRec.Name;
        //         IF ItemSalesHistoryRec.Insert then;
        //     end;

        //     ShowDialog.Close;

    end;


}

