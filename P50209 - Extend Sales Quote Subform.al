pageextension 50209 ExtendSalesQuoteSubform extends "Sales Quote Subform"
{
    layout
    {
        modify("No.")
        {
            Caption = 'SKU';
            ApplicationArea = All;
        }

    }

    actions
    {

    }

    var
        myInt: Integer;
}