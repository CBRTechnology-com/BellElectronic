tableextension 50106 ExtendsWarehouseJournalLine extends "Warehouse Journal Line"
{
    fields
    {
        field(50000; "Alternate Serial Number"; Text[50])
        {

        }
        field(50001; "Owner Type"; Option)
        {
            OptionMembers = "BE","Boeing";
            Caption = 'Owner';
        }
        field(50002; Status; Option)
        {
            OptionMembers = "Saleable","BER","Missing","Rental","Repair","Scrap";
        }
        field(50003; "Item Comment"; Text[50])
        {

        }
        field(50004; "Last Inventoried Date"; Date)
        {

        }
        field(50005; "Item Location"; Text[14])
        {

        }
    }

    var
        myInt: Integer;
}