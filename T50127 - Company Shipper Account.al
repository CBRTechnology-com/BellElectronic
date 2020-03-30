table 50127 "Company Shipper Account"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Shipper Acct No."; Code[20])
        {
            Caption = 'Shipper Acct No.';

        }
        field(2; "Shipper Acct Desc"; Text[50])
        {
            Caption = 'Shipper Acct Desc';

        }

    }

    keys
    {
        key(Key1; "Shipper Acct No.")
        {

        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}