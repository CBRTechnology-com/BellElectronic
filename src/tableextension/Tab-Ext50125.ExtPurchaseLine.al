tableextension 50125 "Ext_PurchaseLine" extends "Purchase Line"
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