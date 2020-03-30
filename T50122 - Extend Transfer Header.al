tableextension 50122 ExtendTransferHeader extends "Transfer Header"
{
    fields
    {
        field(50000; "Customer ID"; Code[10])
        {
            Caption = 'Customer ID';
            TableRelation = Customer;
        }
        field(50001; "Ship To Code"; Code[10])
        {
            Caption = 'Ship To Code';
            TableRelation = "Ship-to Address".Code where ("Customer No." = field ("Customer ID"));
        }
    }

    var
        myInt: Integer;
}