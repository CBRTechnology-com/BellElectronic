pageextension 50210 ExtendSalesOrderSubform extends "Sales Order Subform"
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