page 50222 "Demo Item Tracking Entries"
{

    Caption = 'Item Tracking Entries';
    Editable = true;
    PageType = List;
    SourceTable = "Item Ledger Entry";
    Permissions = tabledata "Item Ledger Entry" = rimd;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Positive; Positive)
                {
                    ApplicationArea = ItemTracking;
                    Editable = false;
                    ToolTip = 'Specifies whether the item in the item ledge entry is positive.';
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = ItemTracking;
                    Editable = false;
                    ToolTip = 'Specifies the document number on the entry. The document is the voucher that the entry was based on, for example, a receipt.';
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = ItemTracking;
                    Caption = 'SKU';
                    Editable = false;
                    ToolTip = 'Specifies the number of the item in the entry.';
                }
                field("Variant Code"; "Variant Code")
                {
                    ApplicationArea = Planning;
                    Editable = false;
                    ToolTip = 'Specifies the variant of the item on the line.';
                    Visible = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = ItemTracking;
                    Editable = false;
                    ToolTip = 'Specifies a description of the entry.';
                    Visible = false;
                }
                field("Serial No."; "Serial No.")
                {
                    ApplicationArea = ItemTracking;
                    Editable = false;
                    ToolTip = 'Specifies a serial number if the posted item carries such a number.';
                }
                field("Lot No."; "Lot No.")
                {
                    ApplicationArea = ItemTracking;
                    Editable = false;
                    ToolTip = 'Specifies a lot number if the posted item carries such a number.';
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = ItemTracking;
                    Editable = false;
                    ToolTip = 'Specifies the code for the location that the entry is linked to.';
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = ItemTracking;
                    Editable = false;
                    ToolTip = 'Specifies the number of units of the item in the item entry.';
                }
                field("Remaining Quantity"; "Remaining Quantity")
                {
                    ApplicationArea = ItemTracking;
                    Editable = false;
                    ToolTip = 'Specifies the quantity in the Quantity field that remains to be processed.';
                }
                field("Source Type"; "Source Type")
                {
                    ApplicationArea = ItemTracking;
                    Editable = false;
                    ToolTip = 'Specifies the source type that applies to the source number, shown in the Source No. field.';
                    Visible = false;
                }
                field("Warranty Date"; "Warranty Date")
                {
                    ApplicationArea = ItemTracking;
                    Editable = false;
                    ToolTip = 'Specifies the last day of warranty for the item on the line.';
                }
                field("Expiration Date"; "Expiration Date")
                {
                    ApplicationArea = ItemTracking;
                    Editable = false;
                    ToolTip = 'Specifies the last date that the item on the line can be used.';
                }
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = ItemTracking;
                    Editable = false;
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
                field("Alternate Serial Number"; "Alternate Serial Number")
                {
                    ApplicationArea = All;
                    Editable = true;
                    trigger OnValidate()
                    begin
                        UpdateWareHouseEntry(1);
                    end;
                }
                field("Owner Type"; "Owner Type")
                {
                    ApplicationArea = All;
                    Editable = true;
                    trigger OnValidate()
                    begin
                        UpdateWareHouseEntry(2);
                    end;
                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                    Editable = true;
                    trigger OnValidate()
                    begin
                        UpdateWareHouseEntry(3);
                    end;
                }
                field("Item Comment"; "Item Comment")
                {
                    ApplicationArea = All;
                    Editable = true;
                    trigger OnValidate()
                    begin
                        UpdateWareHouseEntry(4);
                    end;
                }
                field("Last Inventoried Date"; "Last Inventoried Date")
                {
                    ApplicationArea = All;
                    Editable = true;
                    Caption = 'Last Inventoried Date';
                    trigger OnValidate()
                    begin
                        UpdateWareHouseEntry(5);
                    end;

                }
                field("Item Location"; "Item Location")
                {
                    ApplicationArea = All;
                    Editable = true;
                    Caption = 'Item Location';

                    trigger OnValidate()
                    begin
                        UpdateWareHouseEntry(6);
                    end;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = All;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = All;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Item Tracking Entry")
            {
                Caption = '&Item Tracking Entry';
                Image = Entry;
                action("Serial No. Information Card")
                {
                    ApplicationArea = ItemTracking;
                    Caption = 'Serial No. Information Card';
                    Image = SNInfo;
                    RunObject = Page "Serial No. Information List";
                    RunPageLink = "Item No." = FIELD ("Item No."),
                                  "Variant Code" = FIELD ("Variant Code"),
                                  "Serial No." = FIELD ("Serial No.");
                    ToolTip = 'View or edit detailed information about the serial number.';
                }
                action("Lot No. Information Card")
                {
                    ApplicationArea = ItemTracking;
                    Caption = 'Lot No. Information Card';
                    Image = LotInfo;
                    RunObject = Page "Lot No. Information List";
                    RunPageLink = "Item No." = FIELD ("Item No."),
                                  "Variant Code" = FIELD ("Variant Code"),
                                  "Lot No." = FIELD ("Lot No.");
                    ToolTip = 'View or edit detailed information about the lot number.';
                }
            }
        }
        area(processing)
        {
            action("&Navigate")
            {
                ApplicationArea = ItemTracking;
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Find all entries and documents that exist for the document number and posting date on the selected entry or document.';

                trigger OnAction()
                begin
                    Navigate.SetDoc("Posting Date", "Document No.");
                    Navigate.Run;
                end;
            }
        }
    }

    var
        Navigate: Page Navigate;
        WareHouseEntry: Record "Warehouse Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";

    local procedure UpdateWareHouseEntry(SequenceNo: Integer)
    var

    begin
        ItemLedgerEntry.Reset;
        ItemLedgerEntry.SetRange("Item No.", "Item No.");
        ItemLedgerEntry.SetRange("Serial No.", "Serial No.");
        if ItemLedgerEntry.FindFirst then begin
            case SequenceNo of
                1:
                    ItemLedgerEntry."Alternate Serial Number" := "Alternate Serial Number";
                2:
                    ItemLedgerEntry."Owner Type" := "Owner Type";
                3:
                    ItemLedgerEntry.Status := Status;
                4:
                    ItemLedgerEntry."Item Comment" := "Item Comment";
                5:
                    ItemLedgerEntry."Last Inventoried Date" := "Last Inventoried Date";
                6:
                    ItemLedgerEntry."Item Location" := "Item Location";
            end;
            ItemLedgerEntry.Modify();
        end;

        WareHouseEntry.Reset;
        WareHouseEntry.SetRange("Item No.", "Item No.");
        WareHouseEntry.SetRange("Serial No.", "Serial No.");
        if WareHouseEntry.FindFirst then begin
            case SequenceNo of
                1:
                    WareHouseEntry."Alternate Serial Number" := "Alternate Serial Number";
                2:
                    WareHouseEntry."Owner Type" := "Owner Type";
                3:
                    WareHouseEntry.Status := Status;
                4:
                    WareHouseEntry."Item Comment" := "Item Comment";
                5:
                    WareHouseEntry."Last Inventoried Date" := "Last Inventoried Date";
                6:
                    WareHouseEntry."Item Location" := "Item Location";
            end;
            WareHouseEntry.Modify();
        end;
        CurrPage.Update(false);
    end;
}

