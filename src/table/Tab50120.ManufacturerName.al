table 50120 "Manufacturer Name"
{
    // version CBR_SS

    LookupPageID = "Manufacturers Name";

    fields
    {
        field(1; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Name)
        {
        }
    }

    fieldgroups
    {
    }
}

