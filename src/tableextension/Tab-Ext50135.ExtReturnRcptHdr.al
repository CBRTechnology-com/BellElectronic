tableextension 50135 "Ext_ReturnRcptHdr" extends "Return Receipt Header"
{
    fields
    {
        field(50000; Memo; Text[200])
        {
            Caption = 'Memo';
        }
    }

    var
        myInt: Integer;
}