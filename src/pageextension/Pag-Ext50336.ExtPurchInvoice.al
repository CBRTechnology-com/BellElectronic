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