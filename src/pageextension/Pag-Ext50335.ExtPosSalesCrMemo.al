pageextension 50335 "Ext_PosSalesCrMemo" extends "Posted Sales Credit Memo"
{
    layout
    {
        addafter("External Document No.")
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