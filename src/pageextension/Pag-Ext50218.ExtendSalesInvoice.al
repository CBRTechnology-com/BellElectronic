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
    }

    actions
    {

    }

    var
        myInt: Integer;



}