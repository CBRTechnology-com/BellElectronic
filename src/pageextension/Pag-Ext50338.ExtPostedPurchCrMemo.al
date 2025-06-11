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