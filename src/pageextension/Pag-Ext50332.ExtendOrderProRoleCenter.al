pageextension 50332 ExtendOrderProRoleCenter extends "Business Manager Role Center"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Dimensions)
        {

            action("Recurring General Journal")
            {
                ApplicationArea = All;
                RunObject = page "Recurring General Journal";
            }
        }
    }

    var
        myInt: Integer;
}