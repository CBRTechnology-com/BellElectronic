tableextension 50127 "Ext_PurchInvLine" extends "Purch. Inv. Line"
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