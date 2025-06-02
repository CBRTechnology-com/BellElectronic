tableextension 50129 ExtendSalesInvLine extends "Sales Invoice Line"
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
    }

    var
        myInt: Integer;
}