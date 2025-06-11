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
            field(Model; Rec.Model)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Model field.', Comment = '%';
            }
        }
    }

    actions
    {

    }

    var
        myInt: Integer;



}