tableextension 50119 ExtendPurchCrMemoHdr extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        field(50097; Memo; Text[200])
        {
            Caption = 'Memo';
        }
    }

    var
        myInt: Integer;
}