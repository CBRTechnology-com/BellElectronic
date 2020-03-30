pageextension 50225 ExtendPostedTransferReceipt extends "Posted Transfer Receipt"
{
    layout
    {
        addafter("Direct Transfer")
        {
            field("Customer ID"; "Customer ID")
            {
                ApplicationArea = All;
                Caption = 'Customer ID';
                Editable = false;
                trigger OnAssistEdit()
                begin
                    recCus.GET("Customer ID");
                    PAGE.RUN(PAGE::"Customer Card", recCus);
                end;
            }
            field("Ship To Code"; "Ship To Code")
            {
                ApplicationArea = All;
                Caption = 'Ship To Code';
                Editable = false;
            }
        }
    }

    actions
    {

    }

    var
        myInt: Integer;
        recCus: Record Customer;
}