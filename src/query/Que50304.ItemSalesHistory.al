query 50304 "Item Sales History"
{
    // version CBR_SS
    Caption = 'Item Sales History';
    OrderBy = Ascending (Document_No_);

    elements
    {
        dataitem(Sales_Invoice_Line; "Sales Invoice Line")
        {
            DataItemTableFilter = Type = filter (Item);
            column(Document_No_; "Document No.")
            {

            }
            column(Line_No_; "Line No.")
            {

            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {
            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Item_No_; "No.")
            {

            }
            column(Quantity; Quantity)
            { }

        }
    }
}
