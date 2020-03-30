page 50333 "Posted Sales Inv Details"
{
    // version CBR_SS

    Caption = 'Posted Sales Invoices';
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
                field("Invoice No."; "Invoice No.")
                {
                    ApplicationArea = All;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = All;
                    Visible = false;
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

                field("Item Description"; "Item Description")

                {
                    ApplicationArea = all;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = all;
                }
                field("Serial No."; "Serial No.")
                {
                    ApplicationArea = all;
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
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = all;
                    Visible = false;
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
            action("Show Document")
            {
                ApplicationArea = all;
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    SalesInvHeader.get("Invoice No.");
                    page.RunModal(Page::"Posted Sales Invoice", SalesInvHeader);
                end;
            }

        }


    }



    var
        SalesInvHeader: Record "Sales Invoice Header";
        PostedSalesInvoicePage: Page "Posted Sales Invoice";
        SinvQuerry: Query "Item Sales History";




}

