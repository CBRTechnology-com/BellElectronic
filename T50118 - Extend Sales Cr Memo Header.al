tableextension 50118 ExtendSalesCrMemoHeader extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50097; Memo; Text[200])
        {
            Caption = 'Memo';
        }
        field(50094; "Payment Account"; Code[20])
        {
            Caption = 'Payment Account';

        }
    }

    var
        myInt: Integer;
}