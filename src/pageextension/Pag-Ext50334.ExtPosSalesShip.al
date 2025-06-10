pageextension 50334 "Ext_PosSalesShip" extends "Posted Sales Shipment"
{
    layout
    {
        addafter("External Document No.")
        {
            field(Memo; Memo)
            {
                ApplicationArea = all;
                Caption = 'Memo';
                Editable = false;
            }
        }
    }

    actions
    {

    }

    var
        myInt: Integer;



}