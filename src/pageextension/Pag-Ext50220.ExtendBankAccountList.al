pageextension 50220 ExtendBankAccountList extends "Bank Account List"
{
    layout
    {
        modify("Bank Account No.")
        {
            ApplicationArea = all;
            Visible = true;

        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}