pageextension 50336 "Ext_PurchInvoice" extends "Purchase Invoice"
{
    layout
    {
        addafter(Status)
        {
            field(Memo; Memo)
            {
                ApplicationArea = all;
                Caption = 'Memo';
            }
        }
    }

    actions
    {

    }

    var
        myInt: Integer;



}