pageextension 50207 ExtendsCustomerCard extends "Customer Card"

{
    layout
    {
        addafter("CFDI Relation")
        {
            field(Notes; Notes)
            {
                ApplicationArea = All;
                Caption = 'Notes';
                MultiLine = true;
            }
        }
        addafter("Shipping Agent Service Code")
        {
            field("Shipper Acct No."; "Shipper Acct No.")
            {
                ApplicationArea = All;
                Caption = 'Shipper Acct No.';

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