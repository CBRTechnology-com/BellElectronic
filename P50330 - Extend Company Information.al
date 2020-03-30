pageextension 50330 ExtendCompanyInformation extends "Company Information"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Currencies)
        {
            group("Shipper Account")
            {
                Caption = 'Shipper Account';
                action("Company Shipper Account")
                {
                    Caption = 'Company Shipper Account';
                    ApplicationArea = All;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    Promoted = true;
                    Image = Account;
                    RunObject = page "Company Shipper Acc. List";
                }
            }
        }
    }

    var
        myInt: Integer;
}