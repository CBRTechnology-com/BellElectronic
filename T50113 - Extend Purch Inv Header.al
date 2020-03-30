tableextension 50113 ExtendPurchInvHeader extends "Purch. Inv. Header"
{
    fields
    {
        field(50001; "Seller Name"; Text[60])
        {
            Caption = 'Seller Name';
        }

        field(50002; "Shipper Acct No."; Code[10])
        {
            Caption = 'Shipper Acct No.';
        }

        field(50003; "Shipper Acct Desc"; Text[50])
        {
            Caption = 'Shipper Acct Desc';

        }
        field(50096; "Shipping Agent Code"; Code[10])
        {
            Caption = 'Shipping Agent Code';


        }

        field(50095; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';

        }
        field(50097; Memo; Text[200])
        {
            Caption = 'Memo';
        }

    }

    var
        myInt: Integer;
}