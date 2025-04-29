pageextension 50211 ExtendSalesInvoiceSubform extends "Sales Invoice Subform"
{
    layout
    {
        modify("No.")
        {
            ApplicationArea = All;
            Caption = 'SKU';
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}