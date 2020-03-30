pageextension 50227 ExtendsPostedPurchaseInvoices extends "Posted Purchase Invoices"
{
    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("Seller Name"; "Seller Name")
            {
                Caption = 'Seller Name';
                ApplicationArea = All;
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