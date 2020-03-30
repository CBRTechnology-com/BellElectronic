tableextension 50110 ExtendsCustomer extends Customer

{
    fields
    {
        field(50098; Notes; Text[250])
        {
            Caption = 'Notes';

        }
        field(50097; "Shipper Acct No."; Code[20])
        {
            Caption = 'Shipper Acct No.';

        }

        field(50096; INDUSTRY; Text[50])
        {
            Caption = 'INDUSTRY';
        }
        field(50094; "Payment Account"; Code[20])
        {
            Caption = 'Payment Account';


        }
    }

    var
        myInt: Integer;
}