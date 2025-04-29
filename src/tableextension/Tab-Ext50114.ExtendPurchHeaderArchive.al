tableextension 50114 ExtendPurchHeaderArchive extends "Purchase Header Archive"
{
    fields
    {
        field(50001; "Seller Name"; Text[60])
        {
            Caption = 'Seller Name';
        }
    }

    var
        myInt: Integer;
}