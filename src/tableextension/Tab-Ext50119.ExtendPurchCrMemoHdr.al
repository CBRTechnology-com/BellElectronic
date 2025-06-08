tableextension 50119 ExtendPurchCrMemoHdr extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        field(50097; Memo; Text[200])
        {
            Caption = 'Memo';
        }
        field(50098; Model; Text[100])
        {
            Caption = 'Model';
        }
    }

    var
        myInt: Integer;
}