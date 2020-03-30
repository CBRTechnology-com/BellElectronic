pageextension 50208 ExtendsCustomerList extends "Customer List"
{
    layout
    {
        addafter("Phone No.")
        {
            field(Notes; Notes)
            {
                ApplicationArea = All;
                Caption = 'Notes';

            }
        }

        addafter(Name)
        {
            field("Shipper Acct No."; "Shipper Acct No.")
            {
                ApplicationArea = All;
                Caption = 'Shipper Acct No.';

            }
            field(Address; Address)
            {
                ApplicationArea = All;
                Caption = 'Address';
            }
            field(City; City)
            {
                ApplicationArea = All;
                Caption = 'City';
            }
            field(County; County)
            {
                ApplicationArea = All;
                Caption = 'State';
            }
            field("Preferred Bank Account Code"; "Preferred Bank Account Code")
            {
                ApplicationArea = All;
                Caption = 'Payment Account';
            }

        }
        modify("Post Code")
        {
            ApplicationArea = All;
            Visible = true;
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}