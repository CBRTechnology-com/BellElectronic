pageextension 50213 ExtendPurchaseOrder extends "Purchase Order"
{
    layout
    {
        addafter("Posting Description")
        {
            field("Seller Name"; "Seller Name")
            {
                ApplicationArea = All;
                Caption = 'Seller Name';
            }
            field("Posting No."; "Posting No.")
            {
                ApplicationArea = All;
                Caption = 'Posting No.';
                Editable = true;
            }
            field("Receiving No."; "Receiving No.")
            {
                ApplicationArea = All;
                Caption = 'Receiving No.';
                Editable = true;
            }
        }
        addbefore(Control101)
        {
            group("Shipment Method")
            {
                field("Shipment Method Code 1"; "Shipment Method Code")
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                }
                field("Shipping Agent Code"; "Shipping Agent Code")
                {
                    ApplicationArea = All;
                    Caption = 'Agent';
                }
                field("Shipping Agent Service Code"; "Shipping Agent Service Code")
                {
                    ApplicationArea = All;
                    Caption = 'Agent Service';
                }
                field("Shipper Acct No."; "Shipper Acct No.")
                {
                    ApplicationArea = all;
                }
                field("Shipper Acct Desc"; "Shipper Acct Desc")
                {
                    ApplicationArea = all;
                }

            }
        }
        addafter("Assigned User ID")
        {
            field(Memo; Memo)
            {
                ApplicationArea = All;
                Caption = 'Memo';
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