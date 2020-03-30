query 50303 "Item Stock Status Query"
{
    // version CBR_SS
    Caption = 'Item Stock Status Query';
    OrderBy = Ascending (Item_No), Ascending (Variant_Code), Ascending (Location_Code), Ascending (Lot_No), Ascending (Serial_No);

    elements
    {
        dataitem(Item_Ledger_Entry; "Item Ledger Entry")
        {
            column(Item_No; "Item No.")
            {

            }
            column(Variant_Code; "Variant Code")
            {
            }
            column(Location_Code; "Location Code")
            {
            }
            column(Lot_No; "Lot No.")
            {
                // ColumnFilter = Lot_No = FILTER (<> '');
            }
            column(Serial_No; "Serial No.")
            {
                //ColumnFilter = Serial_No = filter (<> '');
            }

            column(Sum_Qty_Base; "Quantity")
            {
                ColumnFilter = Sum_Qty_Base = FILTER (<> 0);
                Method = Sum;
            }
        }
    }
}
