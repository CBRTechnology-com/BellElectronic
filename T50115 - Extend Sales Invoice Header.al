tableextension 50115 ExtendSalesInvoiceHeader extends "Sales Invoice Header"
{
    fields
    {
        field(50098; "Shipper Acct No."; Code[20])
        {
            Caption = 'Shipper Acct No.';

        }
        field(50097; Memo; Text[200])
        {
            Caption = 'Memo';
        }

        field(50095; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
        }
        field(50094; "Payment Account"; Code[20])
        {
            Caption = 'Payment Account';

        }
        field(50093; "Seller Name"; Text[60])
        {
            Caption = 'Seller Name';
        }
    }

    var
        myInt: Integer;
}