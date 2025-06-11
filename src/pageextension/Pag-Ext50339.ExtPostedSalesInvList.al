pageextension 50339 "Ext_PostedSalesInvList" extends "Posted Sales Invoices"
{
    layout
    {
        addafter("Due Date")
        {

            field("Payment Account"; Rec."Payment Account")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payment Account field.', Comment = '%';
            }
            field(Model; Rec.Model)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Model field.', Comment = '%';
            }
        }
    }



    var

}