pageextension 50219 ExtendPostedSalesInvoice extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Shipment Date")
        {
            field("Payment Account"; "Payment Account")
            {
                ApplicationArea = All;
                Caption = 'Payment Account';
                Editable = false;
            }
        }
        addbefore("Sell-to Customer Name")
        {
            // field("Sell-to Customer No."; "Sell-to Customer No.")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Customer No.';
            // }
        }
        addafter("Sell-to Customer Name")
        {
            field("Shipper Acct No."; "Shipper Acct No.")
            {
                ApplicationArea = All;
                Caption = 'Shipper Acct No.';
                Editable = false;
            }
        }
        addafter("Dispute Status")
        {
            field(Memo; Memo)
            {
                ApplicationArea = All;
                Caption = 'Memo';
                Editable = false;
            }
            field(Model; Rec.Model)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Model field.', Comment = '%';
            }
        }


        modify("External Document No.")
        {
            ApplicationArea = all;
            Caption = 'Customer PO Number';
            Editable = false;
        }
        modify("Package Tracking No.")
        {
            ApplicationArea = all;
            Caption = 'Package Tracking No.';
            Editable = false;
        }

    }

    actions
    {
        addafter(IncomingDocument)
        {
            action("Change Package Tracking No")
            {
                ApplicationArea = all;
                Caption = 'Change Package Tracking No.';
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Clear(UpdatePackTrackingNo);
                    UpdatePackTrackingNo.UpdateDescr("No.");
                    UpdatePackTrackingNo.SetTableView(Rec);
                    UpdatePackTrackingNo.SetRecord(Rec);
                    if UpdatePackTrackingNo.RunModal = Action::ok then;
                end;
            }
        }
    }

    var
        myInt: Integer;
        UpdatePackTrackingNo: Page "Update Package Tracking No";

}