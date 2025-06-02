tableextension 50126 "Ext_PurchRcptLine" extends "Purch. Rcpt. Line"
{
    fields
    {
        field(50000; "Model"; Text[100])
        {
            Caption = 'Model';
        }
    }

    var
        myInt: Integer;
}