table 50128 "Item Sales Info"
{

    Caption = 'Item Sales Info';
    LookupPageId = "Posted Sales Inv Details";
    DrillDownPageId = "Posted Sales Inv Details";
    fields
    {
        field(1; "Invoice No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Sales Invoice Header"."No.";
        }
        field(2; DocumentLineNo; Integer)
        {
            Caption = 'Document Line No.';

        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item."No.";
        }
        field(4; "Customer No"; Code[20])
        {
            Caption = 'Customer No';
            TableRelation = Customer."No.";
        }
        field(5; "Sales Order No"; Code[20])
        {
            Caption = 'Sales Order No';
            TableRelation = "Sales Header"."No.";
        }
        field(6; "Lot No."; Code[20])
        {
            Caption = 'Lot No.';
        }
        field(7; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
            DataClassification = ToBeClassified;
        }
        field(8; "Invoice Date"; Date)
        {
            Caption = 'Doc Date';
        }

        field(9; "Customer Name"; text[50])
        {
            Caption = 'Customer Name';
        }
        field(10; "External Document No"; Code[35])
        {
            Caption = 'External Document No';
        }
        field(11; "Item Description"; text[50])
        {
            Caption = 'Item Description';

        }
        field(12; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
        }
        field(13; "Model"; text[50])
        {
            Caption = 'Model';
        }

        field(14; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }

        field(15; "Expiration Date"; Date)
        {
        }
        field(16; "Warranty Date"; Date)
        {
        }
        field(17; "Qty Available"; Decimal)
        {
        }
        field(18; "Unit Cost"; Decimal)
        {
        }
        field(19; "Unit Price"; Decimal)
        {
        }

        field(20; "Alternate Serial Number"; Text[50])
        {
            Caption = 'Alternate Serial Number';
        }
        field(21; "Owner Type"; Option)
        {
            OptionMembers = "BE","Boeing";
            Caption = 'Owner';
        }
        field(22; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = "Saleable","BER","Missing","Rental","Repair","Scrap";
        }
        field(23; "Item Comment"; Text[50])
        {
            Caption = 'Item Comment';
        }
        field(24; "Last Inventoried Date"; Date)
        {
            Caption = 'Last Inventoried Date';
        }
        field(25; "Item Location"; Text[14])
        {
            Caption = 'Item Location';
        }
        field(26; "Manufacturer Name"; Text[50])
        {
            Caption = 'Manufacturer Name';
        }
        field(27; "Document Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = "Invoice","Shipment";
        }

    }

    keys
    {
        key(Key1; "Invoice No.", DocumentLineNo, "Item No.", "Customer No", "Sales Order No", "Lot No.", "Serial No.")
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

    begin
        DeleteAll;
        if ItemFilter <> '' then
            ItemSalesHistoryQuery.SetFilter(ItemSalesHistoryQuery.Item_No_, ItemFilter);
        ShowDialog.Open('Processing data ..');
        ItemSalesHistoryQuery.Open;
        while ItemSalesHistoryQuery.Read do begin
            IF SalesInvoiceHeader.get(ItemSalesHistoryQuery.Document_No_) then begin
                GetILE(ItemSalesHistoryQuery);
                ItemSalesHistoryRec.Init;
                // Insert the primary key values first ++
                ItemSalesHistoryRec."Invoice No." := SalesInvoiceHeader."No.";
                ItemSalesHistoryRec.DocumentLineNo := ILE."Document Line No.";
                ItemSalesHistoryRec."Item No." := ItemSalesHistoryQuery.Item_No_;
                ItemSalesHistoryRec."Customer No" := SalesInvoiceHeader."Sell-to Customer No.";
                ItemSalesHistoryRec."Sales Order No" := SalesInvoiceHeader."Order No.";
                ItemSalesHistoryRec."Lot No." := ILE."Lot No.";
                ItemSalesHistoryRec."Serial No." := ILE."Serial No.";
                //Update the related field values
                ItemSalesHistoryRec."Document Type" := ItemSalesHistoryRec."Document Type"::Invoice;
                ItemSalesHistoryRec."Invoice Date" := SalesInvoiceHeader."Posting Date";
                ItemSalesHistoryRec."External Document No" := SalesInvoiceHeader."External Document No.";
                ItemSalesHistoryRec."Location Code" := ILE."Location Code";
                ItemSalesHistoryRec."Expiration Date" := ILE."Expiration Date";
                ItemSalesHistoryRec."Warranty Date" := ILE."Warranty Date";
                ItemSalesHistoryRec."Last Inventoried Date" := ILE."Last Inventoried Date";
                ItemSalesHistoryRec."Alternate Serial Number" := ILE."Alternate Serial Number";
                ItemSalesHistoryRec."Item Comment" := ILE."Item Comment";
                ItemSalesHistoryRec."Owner Type" := ILE."Owner Type";
                ItemSalesHistoryRec.Status := ILE.Status;
                ItemSalesHistoryRec.Quantity := ILE.Quantity;

                if Itemrec.Get(ItemSalesHistoryQuery.Item_No_) then begin
                    ItemSalesHistoryRec."Item Description" := Itemrec.Description;
                    if Itemrec."Costing Method" = Itemrec."Costing Method"::Specific then begin
                        GetVLE(ItemSalesHistoryQuery);
                        ItemSalesHistoryRec."Unit Cost" := ABS(VLE."Cost Amount (Actual)")
                    end else
                        ItemSalesHistoryRec."Unit Cost" := Itemrec."Unit Cost";
                    ItemSalesHistoryRec."Unit Price" := Itemrec."Unit Price";
                    ItemSalesHistoryRec."Manufacturer Name" := Itemrec."Manufacturer Name";
                    ItemSalesHistoryRec.Model := Itemrec.Model;
                end;
            end;
            if CustomerRec.get(ItemSalesHistoryQuery.Sell_to_Customer_No_) then
                ItemSalesHistoryRec."Customer Name" := CustomerRec.Name;
            IF ItemSalesHistoryRec.Insert then;
        end;
        ShowDialog.Close;
    end;

    procedure FillTempTablefromItem(ItemC: Code[20])
    var

    begin
        DeleteAll;
        if ItemFilter <> '' then
            ItemSalesHistoryQuery.SetFilter(ItemSalesHistoryQuery.Item_No_, ItemC);
        ShowDialog.Open('Processing data ..');
        ItemSalesHistoryQuery.Open;
        //   Error('test');
        while ItemSalesHistoryQuery.Read do begin
            if SalesinvoiceLine.GET(ItemSalesHistoryQuery.Document_No_, ItemSalesHistoryQuery.Line_No_) then begin
                GetILE(ItemSalesHistoryQuery);
                SalesInvoiceHeader.get(ItemSalesHistoryQuery.Document_No_);
                ItemSalesHistoryRec.Init;
                // Insert the primary key values first ++
                // Invoice No.", DocumentLineNo, " Item No.", " Customer No ", " Sales Order No ", " Lot No.", " Serial No.")
                ItemSalesHistoryRec."Invoice No." := SalesInvoiceHeader."No.";
                ItemSalesHistoryRec.DocumentLineNo := SalesinvoiceLine."Line No.";
                ItemSalesHistoryRec."Item No." := ItemSalesHistoryQuery.Item_No_;
                ItemSalesHistoryRec."Customer No" := SalesInvoiceHeader."Sell-to Customer No.";
                ItemSalesHistoryRec."Sales Order No" := SalesInvoiceHeader."Order No.";
                ItemSalesHistoryRec."Lot No." := ILE."Lot No.";
                ItemSalesHistoryRec."Serial No." := ILE."Serial No.";
                //Update the related field values
                ItemSalesHistoryRec."Document Type" := ItemSalesHistoryRec."Document Type"::Invoice;
                ItemSalesHistoryRec."Invoice Date" := SalesInvoiceHeader."Posting Date";
                ItemSalesHistoryRec."External Document No" := SalesInvoiceHeader."External Document No.";
                ItemSalesHistoryRec."Location Code" := ILE."Location Code";
                ItemSalesHistoryRec."Expiration Date" := ILE."Expiration Date";
                ItemSalesHistoryRec."Warranty Date" := ILE."Warranty Date";
                ItemSalesHistoryRec."Last Inventoried Date" := ILE."Last Inventoried Date";
                ItemSalesHistoryRec."Alternate Serial Number" := ILE."Alternate Serial Number";
                ItemSalesHistoryRec."Item Comment" := ILE."Item Comment";
                ItemSalesHistoryRec."Owner Type" := ILE."Owner Type";
                ItemSalesHistoryRec.Status := ILE.Status;
                ItemSalesHistoryRec.Quantity := ItemSalesHistoryQuery.Quantity;
                //ItemSalesHistoryRec.Quantity := abs(VLE."Item Ledger Entry Quantity");

                if Itemrec.Get(ItemSalesHistoryQuery.Item_No_) then begin
                    ItemSalesHistoryRec."Item Description" := Itemrec.Description;
                    if Itemrec."Costing Method" = Itemrec."Costing Method"::Specific then begin
                        GetVLE(ItemSalesHistoryQuery);
                        ItemSalesHistoryRec."Unit Cost" := ABS(VLE."Cost Amount (Actual)")
                    end else
                        ItemSalesHistoryRec."Unit Cost" := Itemrec."Unit Cost";
                    ItemSalesHistoryRec."Unit Price" := Itemrec."Unit Price";
                    ItemSalesHistoryRec."Manufacturer Name" := Itemrec."Manufacturer Name";
                    ItemSalesHistoryRec.Model := Itemrec.Model;
                end;
                if CustomerRec.get(ItemSalesHistoryQuery.Sell_to_Customer_No_) then
                    ItemSalesHistoryRec."Customer Name" := CustomerRec.Name;
                IF ItemSalesHistoryRec.Insert then;
            end;
        end;
        //  Message(format(ItemSalesHistoryRec.Count));
        ShowDialog.Close;
    end;

    procedure GetILE(ItemSalesQuerry: Query "Item Sales History")
    begin
        ILE.RESET;
        ILE.setrange("Document No.", ItemSalesQuerry.Document_No_);
        ILE.setrange("Document Line No.", ItemSalesQuerry.Line_No_);
        ILE.setrange("Item No.", ItemSalesQuerry.Item_No_);
        ile.SetRange("Source No.", ItemSalesQuerry.Sell_to_Customer_No_);
        IF ILE.FindFirst() then;
    end;

    procedure GetVLE(ItemSalesQuerry: Query "Item Sales History")
    begin
        VLE.RESET;
        VLE.setrange("Document No.", ItemSalesQuerry.Document_No_);
        VLE.setrange("Document Line No.", ItemSalesQuerry.Line_No_);
        VLE.setrange("Item No.", ItemSalesQuerry.Item_No_);
        VLE.SetRange("Source No.", ItemSalesQuerry.Sell_to_Customer_No_);
        IF VLE.FindFirst() then;
    end;

    var
        ItemSalesHistoryQuery: Query "Item Sales History";
        ItemSalesHistoryRec: Record "Item Sales Info";
        Itemrec: Record Item;
        CustomerRec: Record Customer;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesinvoiceLine: Record "Sales Invoice Line";
        VLE: Record "Value Entry";
        ILE: Record "Item Ledger Entry";

}

