pageextension 50223 ExtendTransferOrder extends "Transfer Order"
{
    layout
    {
        addafter(Status)
        {
            field("Customer ID"; "Customer ID")
            {
                ApplicationArea = All;
                Caption = 'Customer ID';
            }
            field("Ship To Code"; "Ship To Code")
            {
                ApplicationArea = All;
                Caption = 'Ship To Code';
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