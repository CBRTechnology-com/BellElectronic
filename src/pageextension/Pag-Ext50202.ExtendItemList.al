pageextension 50202 ExtendItemList extends "Item List"
{
    layout
    {
        addafter("Vendor Item No.")
        {
            field(Manufacturer; Manufacturer)
            {
                ApplicationArea = all;
                Visible = FALSE;

            }
            field(New_Manufacturer; Rec.New_Manufacturer)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Manufacturer field.', Comment = '%';
            }
            // field("Manufacturer Name"; "Manufacturer Name")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Manufacturer';
            // }
            field(Model; Model)
            {
                ApplicationArea = all;
            }
            field("Rental Price"; "Rental Price")
            {
                ApplicationArea = all;
            }
            field("Rental Allowed"; "Rental Allowed")
            {
                ApplicationArea = all;
            }
            field("Mnfg Part No."; "Mnfg Part No.")
            {
                ApplicationArea = all;
            }
            field("No Dealer Sale"; "No Dealer Sale")
            {
                ApplicationArea = all;
            }
            field("Warranty Condition"; "Warranty Condition")
            {
                ApplicationArea = all;
                Visible = false;

            }
            field(Warranty; Warranty)
            {
                ApplicationArea = all;
            }
            field(Condition; Condition)
            {
                ApplicationArea = all;
            }


        }
        addbefore("Substitutes Exist")
        {
            field("Qty. on Sales Order"; "Qty. on Sales Order")
            {
                ApplicationArea = All;
            }
            field("Qty. on Purch. Order"; "Qty. on Purch. Order")
            {
                ApplicationArea = All;
            }
            field("Qty. Sold"; "Qty. Sold")
            {
                ApplicationArea = all;
            }
        }

        modify("No.")
        {
            ApplicationArea = All;
            Caption = 'SKU';
        }
    }

    actions
    {

        addafter(Warehouse)
        {
            action("Item Stock Status Info")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = Journals;
                RunObject = page "Item Stock Status Info";
                RunPageLink = "Item No." = field("No.");
            }
            action("Item Sales History")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = Journals;
                RunObject = page "Item Sales info";
                RunPageLink = "Item No." = field("No.");
            }
            action("Update Item Sales Info")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = Insert;
                Caption = 'Update Qty Sold';
                ToolTip = 'Updates Item Sales Info & Qty Sold';

                trigger OnAction()
                var
                    SalesHistoryRec: Record "Item Sales Info";
                begin
                    SalesHistoryRec.FillTempTablefromItem('');
                end;
            }
        }
    }
    trigger OnOpenPage()
    var
        SalesHistoryRec: Record "Item Sales Info";
    begin
        // SalesHistoryRec.FillTempTablefromItem('');
    end;

    var
        myInt: Integer;
        recItem: Record Item;


}