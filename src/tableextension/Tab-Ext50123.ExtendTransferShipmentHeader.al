tableextension 50123 ExtendTransferShipmentHeader extends "Transfer Shipment Header"
{
    fields
    {
        field(50000; "Customer ID"; Code[10])
        {
            Caption = 'Customer ID';

        }
        field(50001; "Ship To Code"; Code[10])
        {
            Caption = 'Ship To Code';

        }
    }

    var
        myInt: Integer;
}