pageextension 50218 ExtendSalesInvoice extends "Sales Invoice"
{
    layout
    {
        addafter("Payment Terms Code")
        {
            field("Payment Account"; "Payment Account")
            {
                ApplicationArea = All;
                Caption = 'Payment Account';
            }
        }
        modify("External Document No.")
        {
            ApplicationArea = all;
            Caption = 'Customer PO Number';
        }
        addafter("Assigned User ID")
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