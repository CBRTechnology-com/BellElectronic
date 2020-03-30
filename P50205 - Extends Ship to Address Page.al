pageextension 50205 ExtendsShiptoAddressPage extends "Ship-to Address"
{
    layout
    {
        addafter("Tax Area Code")
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