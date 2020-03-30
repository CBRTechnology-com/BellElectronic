pageextension 50221 ExtendsItemTrackingEntries extends "Item Tracking Entries"
{
    Editable = true;
    layout
    {

        addlast(Control1)
        {
            field("Alternate Serial Number"; "Alternate Serial Number")
            {
                ApplicationArea = All;
                Editable = true;
                trigger OnValidate()
                begin
                    UpdateWareHouseEntry();
                end;
            }
            field("Owner Type"; "Owner Type")
            {
                ApplicationArea = All;
                Editable = true;
                trigger OnValidate()
                begin
                    UpdateWareHouseEntry();
                end;
            }
            field(Status; Status)
            {
                ApplicationArea = All;
                Editable = true;
                trigger OnValidate()
                begin
                    UpdateWareHouseEntry();
                end;
            }
            field("Item Comment"; "Item Comment")
            {
                ApplicationArea = All;
                Editable = true;
                trigger OnValidate()
                begin
                    UpdateWareHouseEntry();
                end;
            }
            field("Last Inventoried Date"; "Last Inventoried Date")
            {
                ApplicationArea = All;
                Editable = true;
                Caption = 'Last Inventoried Date';
                trigger OnValidate()
                begin
                    UpdateWareHouseEntry();
                end;

            }
            field("Item Location"; "Item Location")
            {
                ApplicationArea = All;
                Editable = true;
                Caption = 'Item Location';

                trigger OnValidate()
                begin
                    UpdateWareHouseEntry();
                end;
            }
        }
        modify("Item No.")
        {
            Caption = 'SKU';
            ApplicationArea = All;
            Editable = false;
        }
        modify(Positive)
        {
            ApplicationArea = All;
            Editable = false;
        }
        modify("Document No.")
        {
            ApplicationArea = All;
            Editable = false;
        }
        modify("Variant Code")
        {
            ApplicationArea = All;
            Editable = false;
        }
        modify("Serial No.")
        {
            ApplicationArea = All;
            Editable = false;
        }
        modify("Lot No.")
        {
            ApplicationArea = All;
            Editable = false;
        }
        modify("Location Code")
        {
            ApplicationArea = All;
            Editable = false;
        }
        modify(Quantity)
        {
            ApplicationArea = All;
            Editable = false;
        }
        modify("Remaining Quantity")
        {
            ApplicationArea = All;
            Editable = false;
        }
        modify("Source Type")
        {
            ApplicationArea = All;
            Editable = false;
        }
        modify("Warranty Date")
        {
            ApplicationArea = All;
            Editable = false;
        }
        modify("Expiration Date")
        {
            ApplicationArea = All;
            Editable = false;
        }
        modify("Entry No.")
        {
            ApplicationArea = All;
            Editable = false;
        }
    }

    actions
    {

    }
    var
        myInt: Integer;

    local procedure UpdateWareHouseEntry()
    var
        WareHouseEntry: Record "Warehouse Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        ItemLedgerEntry.Reset;

        ItemLedgerEntry.SetRange("Item No.", "Item No.");
        ItemLedgerEntry.SetRange("Lot No.", "Lot No.");
        ItemLedgerEntry.SetRange("Document No.", "Document No.");
        if ItemLedgerEntry.FindSet then begin

            ItemLedgerEntry.ModifyAll("Alternate Serial Number", "Alternate Serial Number");

            ItemLedgerEntry.ModifyAll("Owner Type", "Owner Type");

            ItemLedgerEntry.ModifyAll(Status, Status);

            ItemLedgerEntry.ModifyAll("Item Comment", "Item Comment");

            ItemLedgerEntry.ModifyAll("Last Inventoried Date", "Last Inventoried Date");

            ItemLedgerEntry.ModifyAll("Item Location", "Item Location");
        end;
        WareHouseEntry.Reset;
        WareHouseEntry.SetRange("Source No.", "Document No.");
        WareHouseEntry.SetRange("Item No.", "Item No.");
        WareHouseEntry.SetRange("Lot No.", "Lot No.");
        if WareHouseEntry.FindSet then begin

            WareHouseEntry.ModifyAll("Alternate Serial Number", "Alternate Serial Number");

            WareHouseEntry.ModifyAll("Owner Type", "Owner Type");

            WareHouseEntry.ModifyAll(Status, Status);

            WareHouseEntry.ModifyAll("Item Comment", "Item Comment");

            WareHouseEntry.ModifyAll("Last Inventoried Date", "Last Inventoried Date");

            WareHouseEntry.ModifyAll("Item Location", "Item Location");
        end;
        CurrPage.Update();
    end;
}