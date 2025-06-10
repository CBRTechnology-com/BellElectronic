pageextension 50337 "Ext_PostedPurchRecept" extends "Posted Purchase Receipt"
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