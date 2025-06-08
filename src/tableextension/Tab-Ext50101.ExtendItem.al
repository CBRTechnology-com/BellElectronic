tableextension 50101 ExtendItem extends Item
{


    fields
    {

        field(50000; Manufacturer; Code[10])
        {
            TableRelation = Manufacturer.Code;


        }
        field(50001; Model; Text[50])
        {

        }
        field(50002; "Rental Price"; Decimal)
        {

        }
        field(50003; "Rental Allowed"; Boolean)
        {
            InitValue = true;
        }
        field(50004; "Mnfg Part No."; Text[40])
        {

        }
        field(50005; "No Dealer Sale"; Boolean)
        {

        }
        field(50006; "Warranty Condition"; Code[10])
        {

        }
        field(50007; Warranty; Option)
        {
            OptionMembers = " ","90 Days","6 Months","1 Year","2 Years","3 Years","None";
            InitValue = "1 Year";

        }
        field(50008; Condition; Option)
        {
            OptionMembers = " ","Refurbished","Demo","New";
            InitValue = "Refurbished";

        }
        field(50009; "Manufacturer Name"; Text[50])
        {
            TableRelation = "Manufacturer Name";
            InitValue = 'Keysight / Agilent';
        }
        field(50010; "Qty. Sold"; Decimal)
        {
            FieldClass = FlowField;
            DecimalPlaces = 0 : 5;
            CalcFormula = Sum("Item Sales Info".quantity WHERE("Item No." = field("No.")));
            Editable = false;
            AccessByPermission = TableData "item ledger entry" = R;

        }
        field(50011; New_Manufacturer; Option)
        {
            OptionMembers = " ","Keysight / Agilent","Ametek / Amrel","Ametek / Elgar","Ametek / Sorensen","Ametek / Xantrex","Amplifier Research","Anritsu","Anritsu / Wiltron","Associated Research","Audio Precision","Bird","BK Precision","Chroma","Chroma / Quadtech","Chroma / Associated Research","Clarostat","Ducommun / Wisewave","Electronics & Innovation","ENI (Electronic Navigation Industries)","ETS-Lindgren / EMCO","ETS-Lindgren / Holaday","Fluke","GenRad / IET","GenRad / QuadTech","Giga-tronics / Wavetek","Hughes","IET / QuadTech","Keithley","Kepco","Kikusui","Krytar","Magna-Power","Megger / Biddle","Millitech / Hughes","MI-Wave / TRG","Narda","National Instruments","Phase Matrix / EIP","Polar","Sonoma Instruments","Spellman","Stanford Research","T&C Power Conversion","TDK-Lambda","Tektronix","Valhalla Scientific","Varian / CPI","Weinschel / API","Weinschel Associates","Yokogawa","TDK RF","Huntron","Vitrek","XP Power","Rohde & Schwarz","XP Power / Glassman","Aim-TTi","EA Electro-Automatik","ITECH Electronics";
            Caption = 'Manufacturer';
        }


    }



    fieldgroups
    {
        addlast(DropDown; "Description 2", "Mnfg Part No.", Model)
        {

        }

    }


    var
        myInt: Integer;
}