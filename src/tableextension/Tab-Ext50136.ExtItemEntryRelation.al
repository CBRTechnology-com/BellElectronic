tableextension 50136 "Ext_ItemEntryRelation" extends "Item Entry Relation"
{
    fields
    {
        field(50000; "Alternate Serial No."; Code[50])
        {
            Caption = 'Alternate Serial No.';
        }
        field(50001; "Owner Type"; Enum "Owner Type")
        {
            Caption = 'Owner Type';
        }
        field(50002; "Status"; Enum "Status")
        {
            Caption = 'Status';
        }
        field(50003; "Item Comment"; Text[250])
        {
            Caption = 'Item Comment';
        }
    }

    var
        myInt: Integer;
}