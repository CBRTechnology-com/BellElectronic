pageextension 50204 ExtendsSalesOrder extends "Sales Order"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Shipper Acct No."; "Shipper Acct No.")
            {
                ApplicationArea = All;
                Caption = 'Shipper Acct No.';
            }
        }
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
                ApplicationArea = All;
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
        addfirst("&Print")
        {

            action("Packing Slip")
            {
                ApplicationArea = All;
                Caption = 'Packing Slip';
                Image = Print;
                Ellipsis = true;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                begin
                    DocPrint.PrintSalesOrder(Rec, Usage::"Work Order");
                end;
            }


        }
        modify("Work Order")
        {
            ApplicationArea = All;
            Visible = false;
        }
    }

    var
        myInt: Integer;
        DocPrint: Codeunit "Document-Print";
        Usage: Option "Order Confirmation","Work Order","Pick Instruction";
}