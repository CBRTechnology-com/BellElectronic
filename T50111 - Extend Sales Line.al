tableextension 50111 ExtendSalesLine extends "Sales Line"
{
    fields
    {
        modify("No.")
        {
            Caption = 'SKU';

        }
    }

    var
        myInt: Integer;
}