tableextension 50111 ExtendSalesLine extends "Sales Line"
{
    fields
    {
        field(50000; "Model"; Text[100])
        {
            Caption = 'Model';
        }
        field(50001; "Payment Account"; Code[20])
        {
            Caption = 'Payment Account';
        }
        modify("No.")
        {
            Caption = 'SKU';

        }
    }

    var
        myInt: Integer;
}