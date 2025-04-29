page 50331 "Update Package Tracking No"
{
    PageType = StandardDialog;
    UsageCategory = Administration;
    SourceTable = "Sales Invoice Header";
    Permissions = tabledata 112 = rmid;

    layout
    {
        area(Content)
        {
            group("Update Package Tracking No.")
            {
                field(UpdatePackageTrackingNo; UpdatePackageTrackingNo)
                {
                    ApplicationArea = All;
                    Caption = 'Update Package Tracking No.';
                    Editable = true;

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

    procedure UpdateDescr(DocNo: Code[20])
    begin
        GlobalDocNumber := DocNo;
    end;

    procedure ChangePackageTrackingNo(FromNewPackageTracking: Text[30]; GlobalDocNumber: code[20])
    begin
        IF SalesInvHeader.Get(GlobalDocNumber) AND (FromNewPackageTracking <> '') then begin
            SalesInvHeader."Package Tracking No." := FromNewPackageTracking;
            SalesInvHeader.Modify();
            CurrPage.Update(false);
        end;
    end;


    var
        myInt: Integer;

        UpdatePackageTrackingNo: Text[30];
        GlobalDocNumber: Code[20];
        SalesInvHeader: Record "Sales Invoice Header";

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction IN [ACTION::OK, Action::LookupOK] then
            ChangePackageTrackingNo(UpdatePackageTrackingNo, GlobalDocNumber);

    end;

    trigger OnOpenPage()
    begin
        Clear(UpdatePackageTrackingNo);
    end;
}