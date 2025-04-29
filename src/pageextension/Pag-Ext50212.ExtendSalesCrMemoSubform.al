pageextension 50212 ExtendSalesCrMemoSubform extends "Sales Cr. Memo Subform"
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