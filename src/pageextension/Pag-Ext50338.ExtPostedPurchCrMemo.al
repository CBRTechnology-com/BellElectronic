pageextension 50338 "Ext_PostedPurchCrMemo" extends "Posted Purchase Credit Memo"
{
    layout
    {
        addafter("Responsibility Center")
        {
            field(Memo; Memo)
            {
                ApplicationArea = all;
                Caption = 'Memo';
                Editable = false;
            }
        }
    }

    actions
    {

    }

    var
        myInt: Integer;



}