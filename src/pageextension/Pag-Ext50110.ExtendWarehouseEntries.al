pageextension 50110 ExtendWarehouseEntries extends "Warehouse Entries"
{
    layout
    {
        addlast(Control1)
        {
            field("Alternate Serial Number"; "Alternate Serial Number")
            {
                ApplicationArea = All;
            }
            field("Owner Type"; "Owner Type")
            {
                ApplicationArea = All;
            }
            field(Status; Status)
            {
                ApplicationArea = All;
            }
            field("Item Comment"; "Item Comment")
            {
                ApplicationArea = All;
            }
            field("Last Inventoried Date"; "Last Inventoried Date")
            {
                ApplicationArea = All;
                Caption = 'Last Inventoried Date';
            }
            field("Item Location"; "Item Location")
            {
                ApplicationArea = All;
                Caption = 'Item Location';
            }

        }
    }


    var
        myInt: Integer;
}