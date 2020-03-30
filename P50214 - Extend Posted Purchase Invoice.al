pageextension 50214 ExtendPostPurchaseInvoice extends "Posted Purchase Invoice"
{
    layout
    {
        addafter("Due Date")
        {
            field("Seller Name"; "Seller Name")
            {
                ApplicationArea = All;
                Caption = 'Seller Name';
                Editable = false;
            }
        }
        addafter(Control60)
        {
            group("Shipment Method")
            {
                field("Shipment Method Code 1"; "Shipment Method Code")
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    Editable = false;
                }
                field("Shipping Agent Code"; "Shipping Agent Code")
                {
                    ApplicationArea = All;
                    Caption = 'Agent';
                    Editable = false;
                }
                field("Shipping Agent Service Code"; "Shipping Agent Service Code")
                {
                    ApplicationArea = All;
                    Caption = 'Agent Service';
                    Editable = false;
                }
                field("Shipper Acct No."; "Shipper Acct No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Shipper Acct Desc"; "Shipper Acct Desc")
                {
                    ApplicationArea = all;
                    Editable = false;
                }

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}