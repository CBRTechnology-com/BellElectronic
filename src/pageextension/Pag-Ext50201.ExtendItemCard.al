pageextension 50201 ExtendItemCard extends "Item Card"
{

    layout
    {
        addafter(Description)
        {
            // field("Description 2"; "Description 2")
            // {
            //     Caption = 'Details';
            //     ApplicationArea = all;
            // }


        }

        addafter("Common Item No.")
        {

            field("Manufacturer Name"; "Manufacturer Name")
            {
                ApplicationArea = all;
                Caption = 'Manufacturer';

            }
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
        addafter("Qty. on Sales Order")
        {
            // field("Qty. Sold"; "Qty. Sold")
            // {
            //     ApplicationArea = all;
            // }
        }

        modify("No.")
        {
            ApplicationArea = All;
            Caption = 'SKU';
        }


    }

    actions
    {

        addafter("Item &Tracking Entries")
        {
            action("Demo Tracking Entries")
            {
                ApplicationArea = ItemTracking;
                Caption = 'Item &Tracking Entries';
                Image = ItemTrackingLedger;
                ToolTip = 'View serial or lot numbers that are assigned to items.';

                RunPageLink = "Item No." = FIELD("No.");
                RunObject = Page "Demo Item Tracking Entries";
            }
        }
        modify("Item &Tracking Entries")
        {
            ApplicationArea = ItemTracking;
            Visible = false;
        }

    }
    trigger OnOpenPage()
    var
        SalesHistoryRec: Record "Item Sales Info";
    begin
        SalesHistoryRec.FillTempTablefromItem("No.");
    end;

    var
        myInt: Integer;
        RecManufacturer: Record Manufacturer;
        ManufacturerList: Page Manufacturers;
        recItems: Record Item;

}