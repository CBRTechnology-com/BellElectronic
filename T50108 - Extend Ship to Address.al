tableextension 50108 ExtendsShiptoAddress extends "Ship-to Address"
{
    fields
    {

        field(50000; "Shipper Acct No."; Code[20])
        {
            Caption = 'Shipper Acct No.';
        }
    }

    var
        myInt: Integer;
}