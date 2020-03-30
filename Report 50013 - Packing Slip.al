report 50013 "Packing Slip"
{
    // version CBR_SS

    DefaultLayout = RDLC;
    RDLCLayout = './Packing Slip.rdlc';
    Caption = 'Packing Slip';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING ("Document Type", "No.") WHERE ("Document Type" = CONST (Order));
            RequestFilterFields = "No.", "Sell-to Customer No.";
            RequestFilterHeading = 'Sales Order';
            dataitem(PageLoop; "Integer")
            {
                DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                column(No1_SalesHeader; "Sales Header"."No.")
                {
                }
                column(Shipper_Acct_No_; "Sales Header"."Shipper Acct No.")
                {

                }
                column(PackageTrackingNo; "Sales Header"."Package Tracking No.")
                {

                }
                column(ShipMethodDesc; ShipmentMethod.Description)
                {

                }
                column(Shipping_Agent_Code; "Sales Header"."Shipping Agent Code")
                {

                }
                column(Shipping_Agent_Service_Code; "Sales Header"."Shipping Agent Service Code")
                {

                }
                column(PONo; "Sales Header"."External Document No.")
                {

                }
                column(SalesPerson; "Sales Header"."Salesperson Code")
                {

                }
                column(ShipmentDate_SalesHeader; Format("Sales Header"."Shipment Date"))
                {
                }
                column(OrderDate; "Sales Header"."Order Date")
                {

                }
                column(BillToCust; "Sales Header"."Bill-to Customer No.")
                {

                }
                column(CompanyName; COMPANYPROPERTY.DisplayName)
                {
                }
                column(CustAddr1; CustAddr[1])
                {
                }
                column(CustAddr2; CustAddr[2])
                {
                }
                column(CustAddr3; CustAddr[3])
                {
                }
                column(CustAddr4; CustAddr[4])
                {
                }
                column(CustAddr5; CustAddr[5])
                {
                }
                column(CustAddr6; CustAddr[6])
                {
                }
                column(CustAddr7; CustAddr[7])
                {
                }
                column(CustAddr8; CustAddr[8])
                {
                }
                column(ShipmentDateCaption; ShipmentDateCaptionLbl)
                {
                }
                column(SalesOrderNoCaption; SalesOrderNoCaptionLbl)
                {
                }
                column(PageNoCaption; PageNoCaptionLbl)
                {
                }
                column(WorkOrderCaption; WorkOrderCaptionLbl)
                {
                }
                column(ShipToAddress1; ShipToAddress[1])
                {
                }
                column(ShipToAddress2; ShipToAddress[2])
                {
                }
                column(ShipToAddress3; ShipToAddress[3])
                {
                }
                column(ShipToAddress4; ShipToAddress[4])
                {
                }
                column(ShipToAddress5; ShipToAddress[5])
                {
                }
                column(ShipToAddress6; ShipToAddress[6])
                {
                }
                column(ShipToAddress7; ShipToAddress[7])
                {
                }
                column(ShipToAddress8; ShipToAddress[8])
                {
                }
                column(CustContact; Cust.Contact)
                {
                }
                column(CustEmail; Cust."E-Mail")
                {
                }
                column(CustPhoneNo; Cust."Phone No.")
                {
                }
                dataitem("Sales Line"; "Sales Line")
                {
                    DataItemLink = "Document Type" = FIELD ("Document Type"), "Document No." = FIELD ("No.");
                    DataItemLinkReference = "Sales Header";
                    DataItemTableView = SORTING ("Document Type", "Document No.", "Line No.");
                    column(No_SalesLine; "No.")
                    {
                        IncludeCaption = true;
                    }
                    column(Description_SalesLine; Description)
                    {
                        IncludeCaption = true;
                    }
                    column(Quantity_SalesLine; Quantity)
                    {
                        IncludeCaption = true;
                        DecimalPlaces = 0 : 5;
                    }
                    column(UnitofMeasure_SalesLine; "Unit of Measure")
                    {
                        IncludeCaption = true;
                    }
                    column(Type_SalesLine; Type)
                    {
                        IncludeCaption = true;
                    }
                    column(Qty__to_Ship; "Qty. to Ship")
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(Qty__to_Invoice; "Qty. to Invoice")
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(Qty__to_Ship__Base_; "Qty. to Ship (Base)")
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(Qty__Shipped__Base_; "Qty. Shipped (Base)")
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(QtyworkPostSalesOrderCptn; QtyworkPostSalesOrderCptnLbl)
                    {
                    }
                    column(QuantityUsedCaption; QuantityUsedCaptionLbl)
                    {
                    }
                    column(UnitofMeasureCaption; UnitofMeasureCaptionLbl)
                    {
                    }
                    column(SerialNo; GetSerialNos)
                    {
                    }

                    column(Manufacturer; Item."Manufacturer Name")
                    {
                    }
                    column(Model; Item.Model)
                    {
                    }
                    column(Condition; Condition)
                    {
                    }
                    column(Warranty; Item.Warranty)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        // Bell >>
                        Clear(Item);
                        Clear(Condition);
                        if Type = Type::Item then
                            if Item.Get("No.") then
                                Condition := Format(Item.Condition);
                        // Bell <<
                    end;
                }
                dataitem("Sales Comment Line"; "Sales Comment Line")
                {
                    DataItemLink = "Document Type" = FIELD ("Document Type"), "No." = FIELD ("No.");
                    DataItemLinkReference = "Sales Header";
                    DataItemTableView = WHERE ("Document Line No." = CONST (0));
                    column(Date_SalesCommentLine; Format(Date))
                    {
                    }
                    column(Code_SalesCommentLine; Code)
                    {
                        IncludeCaption = true;
                    }
                    column(Comment_SalesCommentLine; Comment)
                    {
                        IncludeCaption = true;
                    }
                    column(CommentsCaption; CommentsCaptionLbl)
                    {
                    }
                    column(SalesCommentLineDtCptn; SalesCommentLineDtCptnLbl)
                    {
                    }
                }
                dataitem("Extra Lines"; "Integer")
                {
                    DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                    column(NoCaption; NoCaptionLbl)
                    {
                    }
                    column(DescriptionCaption; DescriptionCaptionLbl)
                    {
                    }
                    column(QuantityCaption; QuantityCaptionLbl)
                    {
                    }
                    column(UnitofMeasureCaptionControl33; UnitofMeasureCaptionControl33Lbl)
                    {
                    }
                    column(DateCaption; DateCaptionLbl)
                    {
                    }
                    column(workPostdItemorResJnlCptn; workPostdItemorResJnlCptnLbl)
                    {
                    }
                    column(TypeCaption; TypeCaptionLbl)
                    {
                    }
                }
            }

            trigger OnAfterGetRecord()
            begin
                FormatAddr.SalesHeaderBillTo(CustAddr, "Sales Header");
                FormatAddr.SalesHeaderShipTo(ShipToAddress, ShipToAddress, "Sales Header");
                FormatDocument.SetShipmentMethod(ShipmentMethod, "Shipment Method Code", "Language Code");

                if not Cust.Get("Sell-to Customer No.") then
                    Clear(Cust);

            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        FormatAddr: Codeunit "Format Address";

        FormatDocument: Codeunit "Format Document";
        CustAddr: array[8] of Text[50];
        ShipmentDateCaptionLbl: Label 'Shipment Date';
        SalesOrderNoCaptionLbl: Label 'Sales Order No.';
        PageNoCaptionLbl: Label 'Page';
        WorkOrderCaptionLbl: Label 'Work Order';
        QtyworkPostSalesOrderCptnLbl: Label 'Quantity used during work (Posted with the Sales Order)';
        QuantityUsedCaptionLbl: Label 'Quantity Used';
        UnitofMeasureCaptionLbl: Label 'Unit of Measure';
        CommentsCaptionLbl: Label 'Comments';
        SalesCommentLineDtCptnLbl: Label 'Date';
        NoCaptionLbl: Label 'No.';
        DescriptionCaptionLbl: Label 'Description';
        QuantityCaptionLbl: Label 'Quantity';
        UnitofMeasureCaptionControl33Lbl: Label 'Unit of Measure';
        DateCaptionLbl: Label 'Date';
        workPostdItemorResJnlCptnLbl: Label 'Extra Item/Resource used during work (Posted with Item or Resource Journals)';
        TypeCaptionLbl: Label 'Type';
        ShipToAddress: array[8] of Text[50];
        ReservEntry: Record "Reservation Entry";
        SerialNo: Code[20];
        i: Integer;
        Condition: Text;
        Item: Record Item;
        ShipmentMethod: Record "Shipment Method";
        Cust: Record Customer;

    local procedure GetSerialNos() SerialNos: Text
    var
        ReservationEntry: Record "Reservation Entry";
        SalesLineReserve: Codeunit "Sales Line-Reserve";
    begin
        // Bell >>
        SalesLineReserve.FilterReservFor(ReservationEntry, "Sales Line");
        if ReservationEntry.FindSet then
            repeat
                if SerialNos <> '' then
                    SerialNos += ', ' + ReservationEntry."Serial No."
                else
                    SerialNos := ReservationEntry."Serial No.";
            until ReservationEntry.Next = 0;
        // Bell <<
    end;

}

