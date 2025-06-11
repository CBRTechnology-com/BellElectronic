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
            field(Model; Rec.Model)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Model field.', Comment = '%';
            }
        }
    }

    actions
    {

    }

    var
        myInt: Integer;



}