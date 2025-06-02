tableextension 50134 "Ext_PurchLineArch" extends "Purchase Line Archive"
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