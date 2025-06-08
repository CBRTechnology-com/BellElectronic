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
        field(50098; "Shipper Acct No."; Code[20])
        {
            Caption = 'Shipper Acct No.';

        }
        field(50099; Model; Text[100])
        {
            Caption = 'Model';
        }
    }

    var
        myInt: Integer;
}