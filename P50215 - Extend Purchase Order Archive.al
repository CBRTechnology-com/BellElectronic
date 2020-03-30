pageextension 50215 ExtendsPurchOrderArchive extends "Purchase Order Archive"
{
    layout
    {
        addafter("Buy-from Contact No.")
        {
            field("Seller Name"; "Seller Name")
            {
                ApplicationArea = All;
                Editable = false;

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