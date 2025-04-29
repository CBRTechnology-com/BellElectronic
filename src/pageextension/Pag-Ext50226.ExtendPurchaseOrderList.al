pageextension 50226 ExtendPurchaseOrderList extends "Purchase Order List"
{
    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("Seller Name"; "Seller Name")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}