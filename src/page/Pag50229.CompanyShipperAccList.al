page 50229 "Company Shipper Acc. List"
{
    PageType = List;
    SourceTable = "Company Shipper Account";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Shipper Acct No."; "Shipper Acct No.")
                {
                    ApplicationArea = All;
                }
                field("Shipper Acct Desc"; "Shipper Acct Desc")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}