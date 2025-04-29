pageextension 50206 extendShiptoAddressList extends "Ship-to Address List"
{
    layout
    {
        addafter("Location Code")
        {
            field("Shipper Acct No."; "Shipper Acct No.")
            {
                ApplicationArea = all;
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