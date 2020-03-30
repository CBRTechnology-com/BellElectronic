pageextension 50216 ExtendSalesOrderList extends "Sales Order List"
{
    layout
    {
        modify("External Document No.")
        {
            ApplicationArea = all;
            Caption = 'Customer PO Number';
        }

    }

    actions
    {
        addfirst("&Print")
        {
            action("Packing Slip")
            {
                ApplicationArea = All;
                Caption = 'Packing Slip';
                Image = Print;
                Ellipsis = true;
                trigger OnAction()
                begin
                    DocPrint.PrintSalesOrder(Rec, Usage::"Work Order");
                end;
            }

        }
        modify("Work Order")
        {
            ApplicationArea = all;
            Visible = false;
        }
    }

    var
        myInt: Integer;
        DocPrint: Codeunit "Document-Print";
        Usage: Option "Order Confirmation","Work Order","Pick Instruction";
}