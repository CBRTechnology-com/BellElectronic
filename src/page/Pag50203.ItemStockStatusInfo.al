page 50203 "Item Stock Status Info"
{
    // version CBR_SS

    Caption = 'Item Stock Status Info';
    Editable = false;
    PageType = List;
    Permissions = TableData "Purch. Rcpt. Line" = rimd;
    SourceTable = "Item Stock Status Information";


    layout
    {
        area(content)
        {
            repeater(Control7)
            {
                ShowCaption = false;
                field("Item No."; "Item No.")
                {
                    ApplicationArea = Warehouse;
                    Style = None;
                    StyleExpr = StyleText;
                    ToolTip = 'Specifies the item that exists as lot numbers in the bin.';
                }
                field(Description; Description)
                {
                    StyleExpr = StyleText;
                    ApplicationArea = all;
                }
                field("Zone Code"; "Zone Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the zone that is assigned to the bin where the lot number exists.';
                    Visible = false;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = all;
                }
                field("Bin Code"; "Bin Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the bin where the lot number exists.';
                    Visible = false;
                }
                field("Lot No."; "Lot No.")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the lot number that exists in the bin.';
                }
                field("Serial No."; "Serial No.")
                {
                    ApplicationArea = all;
                }
                field("Expiration Date"; "Expiration Date")
                {
                    ApplicationArea = all;
                }
                field("Warranty Date"; "Warranty Date")
                {
                    ApplicationArea = all;
                }
                field("Qty Available"; "Qty Available")
                {
                    DecimalPlaces = 0 : 0;
                    ApplicationArea = all;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                    Caption = 'Quantity On Hand';
                    ToolTip = 'Specifies how many items with the lot number exist in the bin.';
                }
                field("Unit Cost"; "Unit Cost")
                {
                    ApplicationArea = all;
                }
                field("Unit Price"; "Unit Price")
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
                field("Manufacturer Name"; "Manufacturer Name")
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
                ApplicationArea = all;

                trigger OnAction()
                begin
                    FillTempTable
                end;
            }
            action("Update Purch Rect Line")
            {
                Visible = false;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    PurchRectLine.Reset;
                    PurchRectLine.SetRange("Buy-from Vendor No.", '');
                    if PurchRectLine.FindFirst then
                        repeat
                            PurchRectLine."Buy-from Vendor No." := PurchRectLine."Pay-to Vendor No.";
                            PurchRectLine.Modify;
                        until PurchRectLine.Next = 0;

                    Message('completed');
                end;
            }
            action(CheckDate)
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    if "Expiration Date" <> 0D then
                        CalcExpDate;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CalcExpDate; //CBR_SS
    end;

    trigger OnOpenPage()
    begin
        FillTempTable;
    end;

    var
        PurchRectLine: Record "Purch. Rcpt. Line";
        Days: Integer;
        Warning: Boolean;
        StyleText: Text[20];

    local procedure CalcExpDate()
    begin
        //CBR_SS>>
        StyleText := '';
        if "Expiration Date" <> 0D then begin
            Days := "Expiration Date" - Today;
            if (Days <= 180) and (Days > 90) then
                StyleText := 'StrongAccent' //For Blue Color
            else
                if (Days <= 90) and (Days > 30) then
                    StyleText := 'AttentionAccent' // For Blue Italic Color
                else
                    if (Days <= 30) and (Days > 0) then
                        StyleText := 'Attention' //For Red Italic Color
                    else
                        if (Days = 0) or (Days < 0) then
                            StyleText := 'Unfavorable' //For Bold Red Italic Color
                        else
                            StyleText := 'Standard' //For Black Color
        end;
        //CBR_SS<<
    end;
}

