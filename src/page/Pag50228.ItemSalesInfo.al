page 50228 "Item Sales Info"
{
    // version CBR_SS

    Caption = 'Item Sales info';
    Editable = false;
    PageType = List;
    SourceTable = "Item Sales Info";


    layout
    {
        area(content)
        {
            repeater(Control7)
            {
                ShowCaption = false;
                field("Document No."; "Invoice No.")
                {
                    ApplicationArea = All;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = All;
                }
                field("Doc Date"; "Invoice Date")
                {
                    ApplicationArea = All;
                }
                field("Customer No"; "Customer No")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; "Customer Name")
                {
                    ApplicationArea = All;
                }
                field("External Doc No"; "External Document No")
                {
                    ApplicationArea = All;
                }
                field("Sales Order No"; "Sales Order No")
                {
                    ApplicationArea = All;
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = all;
                }
                field("Item Description"; "Item Description")

                {
                    ApplicationArea = all;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Manufacturer Name"; "Manufacturer Name")
                {
                    ApplicationArea = All;
                }
                field(Model; Model)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; "Unit Price")
                {
                    ApplicationArea = all;
                }
                field("Unit Cost"; "Unit Cost")
                {
                    ApplicationArea = all;
                }
                field("Serial No."; "Serial No.")
                {
                    ApplicationArea = all;
                }
                field("Alternate Serial Number"; "Alternate Serial Number")
                {
                    ApplicationArea = all;
                }
                field("Owner Type"; "Owner Type")
                {
                    ApplicationArea = all;
                }
                field(Status; Status)
                {
                    ApplicationArea = all;
                }
                field("Item Comment"; "Item Comment")
                {
                    ApplicationArea = all;
                }
                field("Last Inventoried Date"; "Last Inventoried Date")
                {
                    ApplicationArea = all;
                }
                field("Item Location"; "Item Location")
                {
                    ApplicationArea = all;
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Update Data")
            {
                Image = UpdateShipment;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    FillTempTable
                end;
            }


        }
    }

    trigger OnAfterGetRecord()
    begin

    end;

    trigger OnOpenPage()
    begin
        FillTempTable;
    end;

    var
        PurchRectLine: Record "Purch. Rcpt. Line";




}

