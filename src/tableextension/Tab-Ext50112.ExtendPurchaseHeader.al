tableextension 50112 ExtendPurchaseHeader extends "Purchase Header"
{
    fields
    {
        field(50001; "Seller Name"; Text[60])
        {
            Caption = 'Seller Name';
        }
        field(50097; Memo; Text[200])
        {
            Caption = 'Memo';
        }
        field(50096; "Shipping Agent Code"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
            AccessByPermission = tabledata 5790 = r;
        }

        field(50095; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code WHERE("Shipping Agent Code" = FIELD("Shipping Agent Code"));
        }

        field(50002; "Shipper Acct No."; Code[20])
        {
            Caption = 'Shipper Acct No.';
            TableRelation = "Company Shipper Account"."Shipper Acct No.";
            trigger OnValidate()
            begin
                if CompanyShipperAcc.get("Shipper Acct No.") then
                    "Shipper Acct Desc" := CompanyShipperAcc."Shipper Acct Desc";
            end;
        }

        field(50003; "Shipper Acct Desc"; Text[50])
        {
            Caption = 'Shipper Acct Desc';
            Editable = false;

        }
        field(50098; Model; Text[100])
        {
            Caption = 'Model';
        }
    }

    var
        myInt: Integer;

        CompanyShipperAcc: Record "Company Shipper Account";
}