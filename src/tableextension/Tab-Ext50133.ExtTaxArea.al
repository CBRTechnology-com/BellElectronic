tableextension 50133 Ext_SalesLineArch extends "Sales Line Archive"
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