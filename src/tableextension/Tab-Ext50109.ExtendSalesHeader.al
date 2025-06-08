tableextension 50109 ExtendSalesHeader extends "Sales Header"
{
    fields
    {
        field(50098; "Shipper Acct No."; Code[20])
        {
            Caption = 'Shipper Acct No.';
        }
        field(50097; Memo; Text[200])
        {
            Caption = 'Memo';
        }
        field(50094; "Payment Account"; Code[20])
        {
            Caption = 'Payment Account';
            TableRelation = "Customer Bank Account".Code WHERE("Customer No." = FIELD("Sell-to Customer No."));

        }
        field(50093; "Seller Name"; Text[60])
        {
            Caption = 'Seller Name';

        }
        field(50099; Model; Text[100])
        {
            Caption = 'Model';
        }


    }


    var
        myInt: Integer;
        ShipToAddress: Record "Ship-to Address";
        Custrec: Record Customer;
}