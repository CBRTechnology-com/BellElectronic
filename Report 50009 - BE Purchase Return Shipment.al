report 50009 "BE Purchase Return Shipment"
{
    // version NAVNA10.00

    DefaultLayout = RDLC;
    RDLCLayout = './BE Purchase Return Shipment.rdlc';
    Caption = 'Return Shipment';

    dataset
    {
        dataitem("Return Shipment Header"; "Return Shipment Header")
        {
            DataItemTableView = SORTING("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Buy-from Vendor No.", "Pay-to Vendor No.", "No. Printed";
            RequestFilterHeading = 'Return Shipment';
            column(No_ReturnShipmentHeader; "No.")
            {
            }
            column(FromCaption; FromCaptionLbl)
            {
            }
            column(ReceiveByCaption; ReceiveByCaptionLbl)
            {
            }
            column(VendorIDCaption; VendorIDCaptionLbl)
            {
            }
            column(ConfirmToCaption; ConfirmToCaptionLbl)
            {
            }
            column(BuyerCaption; BuyerCaptionLbl)
            {
            }
            column(ShipCaption; ShipCaptionLbl)
            {
            }
            column(ToCaption; ToCaptionLbl)
            {
            }
            column(ReturnShipmentCaption; ReturnShipmentCaptionLbl)
            {
            }
            column(ReturnShpNumberCaption; ReturnShpNumberCaptionLbl)
            {
            }
            column(ReturnShipmentDateCaption; ReturnShipmentDateCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(ShipViaCaption; ShipViaCaptionLbl)
            {
            }
            column(RONumberCaption; RONumberCaptionLbl)
            {
            }
            column(PurchaseCaption; PurchaseCaptionLbl)
            {
            }
            column(ItemNoCaption; ItemNoCaptionLbl)
            {
            }
            column(UnitCaption; UnitCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(ShippedCaption; ShippedCaptionLbl)
            {
            }
            column(AuthorizedCaption; AuthorizedCaptionLbl)
            {
            }
            column(ToBeShippedCaption; ToBeShippedCaptionLbl)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(CompanyAddress1; CompanyAddress[1])
                    {
                    }
                    column(CompanyAddress2; CompanyAddress[2])
                    {
                    }
                    column(CompanyAddress3; CompanyAddress[3])
                    {
                    }
                    column(CompanyAddress4; CompanyAddress[4])
                    {
                    }
                    column(CompanyAddress5; CompanyAddress[5])
                    {
                    }
                    column(CompanyAddress6; CompanyAddress[6])
                    {
                    }
                    column(CopyTxt; CopyTxt)
                    {
                    }
                    column(BuyFromAddress1; BuyFromAddress[1])
                    {
                    }
                    column(BuyFromAddress2; BuyFromAddress[2])
                    {
                    }
                    column(BuyFromAddress3; BuyFromAddress[3])
                    {
                    }
                    column(BuyFromAddress4; BuyFromAddress[4])
                    {
                    }
                    column(BuyFromAddress5; BuyFromAddress[5])
                    {
                    }
                    column(BuyFromAddress6; BuyFromAddress[6])
                    {
                    }
                    column(BuyFromAddress7; BuyFromAddress[7])
                    {
                    }
                    column(ExpectedRcptDate_ReturnShpHdr; "Return Shipment Header"."Expected Receipt Date")
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
                    column(BuyfromVendNo_ReturnShpHdr; "Return Shipment Header"."Buy-from Vendor No.")
                    {
                    }
                    column(YourReference_ReturnShpHdr; "Return Shipment Header"."Your Reference")
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(DocDate_ReturnShpHdr; "Return Shipment Header"."Document Date")
                    {
                    }
                    column(CompanyAddress7; CompanyAddress[7])
                    {
                    }
                    column(CompanyAddress8; CompanyAddress[8])
                    {
                    }
                    column(BuyFromAddress8; BuyFromAddress[8])
                    {
                    }
                    column(ShipToAddress8; ShipToAddress[8])
                    {
                    }
                    column(ShipmentMethodDescription; ShipmentMethod.Description)
                    {
                    }
                    column(ReturnOrderNo_ReturnShpHdr; "Return Shipment Header"."Return Order No.")
                    {
                    }
                    column(CopyNo; CopyNo)
                    {
                    }
                    column(CompanyEmail; CompanyInformation."E-Mail")
                    {
                    }
                    dataitem("Return Shipment Line"; "Return Shipment Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Return Shipment Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(ItemNumberToPrint; ItemNumberToPrint)
                        {
                        }
                        column(UOM_ReturnShipmentLine; "Unit of Measure")
                        {
                        }
                        column(Qty_ReturnShipmentLine; Quantity)
                        {
                        }
                        column(OrderedQuantity; OrderedQuantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(BackOrderedQuantity; BackOrderedQuantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(LineNo_ReturnShpLine; "Line No.")
                        {
                        }
                        column(Description_ReturnShpLine; Description)
                        {
                        }
                        column(Manufacturer; Item."Manufacturer Name")
                        {
                        }
                        column(Model; Item.Model)
                        {
                        }
                        column(SerialNos; GetSerialNos)
                        {
                        }
                        column(Condition; Condition)
                        {
                        }
                        column(ReturnReason_Code; ReturnReason.Code)
                        {
                        }
                        column(ReturnReason_Description; ReturnReason.Description)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            OnLineNumber := OnLineNumber + 1;

                            OrderedQuantity := 0;
                            BackOrderedQuantity := 0;
                            if "Return Order No." = '' then
                                OrderedQuantity := Quantity
                            else
                                if OrderLine.Get(5, "Return Order No.", "Return Order Line No.") then begin
                                    OrderedQuantity := OrderLine.Quantity;
                                    BackOrderedQuantity := OrderLine."Outstanding Quantity";
                                end else begin
                                    ReturnLine.SetCurrentKey("Return Order No.", "Return Order Line No.");
                                    ReturnLine.SetRange("Return Order No.", "Return Order No.");
                                    ReturnLine.SetRange("Return Order Line No.", "Return Order Line No.");
                                    ReturnLine.Find('-');
                                    repeat
                                        OrderedQuantity := OrderedQuantity + ReturnLine.Quantity;
                                    until 0 = ReturnLine.Next;
                                end;

                            if Type = 0 then begin
                                ItemNumberToPrint := '';
                                "Unit of Measure" := '';
                                OrderedQuantity := 0;
                                BackOrderedQuantity := 0;
                                Quantity := 0;
                            end else
                                if Type = Type::"G/L Account" then
                                    ItemNumberToPrint := "Vendor Item No."
                                else
                                    ItemNumberToPrint := "No.";

                            // Bell >>
                            Clear(Item);
                            Clear(Condition);
                            if Type = Type::Item then
                                if Item.Get("No.") then
                                    Condition := Format(Item.Condition);

                            Clear(ReturnReason);
                            if "Return Reason Code" <> '' then
                                if ReturnReason.Get("Return Reason Code") then;
                            // Bell <<
                        end;

                        trigger OnPreDataItem()
                        begin
                            OnLineNumber := 0;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    //CurrReport.PageNo := 1;

                    if CopyNo = NoLoops then begin
                        if not CurrReport.Preview then
                            PurchaseShptPrinted.Run("Return Shipment Header");
                        CurrReport.Break;
                    end;
                    CopyNo := CopyNo + 1;
                    if CopyNo = 1 then // Original
                        Clear(CopyTxt)
                    else
                        CopyTxt := Text000;
                end;

                trigger OnPreDataItem()
                begin
                    NoLoops := 1 + Abs(NoCopies);
                    if NoLoops <= 0 then
                        NoLoops := 1;
                    CopyNo := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if PrintCompany then
                    if RespCenter.Get("Responsibility Center") then begin
                        FormatAddress.RespCenter(CompanyAddress, RespCenter);
                        CompanyInformation."Phone No." := RespCenter."Phone No.";
                        CompanyInformation."Fax No." := RespCenter."Fax No.";
                    end;
                //CurrReport.Language := Language.GetLanguageID("Language Code"); //CBR_SS
                CurrReport.Language := Language.GetLanguageIdOrDefault("Language Code");

                if "Purchaser Code" = '' then
                    Clear(SalesPurchPerson)
                else
                    SalesPurchPerson.Get("Purchaser Code");

                if "Shipment Method Code" = '' then
                    Clear(ShipmentMethod)
                else
                    ShipmentMethod.Get("Shipment Method Code");

                if "Buy-from Vendor No." = '' then begin
                    "Buy-from Vendor Name" := Text009;
                    "Ship-to Name" := Text009;
                end;

                FormatAddress.PurchShptBuyFrom(BuyFromAddress, "Return Shipment Header");
                FormatAddress.PurchShptShipTo(ShipToAddress, "Return Shipment Header");

                if LogInteraction then
                    if not CurrReport.Preview then
                        SegManagement.LogDocument(
                          15, "No.", 0, 0, DATABASE::Vendor, "Buy-from Vendor No.", "Purchaser Code", '', "Posting Description", '');
            end;

            trigger OnPreDataItem()
            begin
                if PrintCompany then
                    FormatAddress.Company(CompanyAddress, CompanyInformation)
                else
                    Clear(CompanyAddress);
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NumberOfCopies; NoCopies)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Number of Copies';
                        ToolTip = 'Specifies the number of copies of each document (in addition to the original) that you want to print.';
                    }
                    field(PrintCompanyAddress; PrintCompany)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Print Company Address';
                        ToolTip = 'Specifies if your company address is printed at the top of the sheet, because you do not use pre-printed paper. Leave this check box blank to omit your company''s address.';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want to record the related interactions with the involved contact person in the Interaction Log Entry table.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            LogInteraction := SegManagement.FindInteractTmplCode(15) <> '';
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompanyInformation.Get('');
    end;

    var
        ShipmentMethod: Record "Shipment Method";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInformation: Record "Company Information";
        ReturnLine: Record "Return Shipment Line";
        OrderLine: Record "Purchase Line";
        RespCenter: Record "Responsibility Center";
        Language: Codeunit Language;
        CompanyAddress: array[8] of Text[50];
        BuyFromAddress: array[8] of Text[50];
        ShipToAddress: array[8] of Text[50];
        CopyTxt: Text[10];
        ItemNumberToPrint: Text[20];
        PrintCompany: Boolean;
        NoCopies: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
        OnLineNumber: Integer;
        PurchaseShptPrinted: Codeunit "Return Shipment - Printed";
        FormatAddress: Codeunit "Format Address";
        OrderedQuantity: Decimal;
        BackOrderedQuantity: Decimal;
        SegManagement: Codeunit SegManagement;
        LogInteraction: Boolean;
        Text000: Label 'COPY';
        Text009: Label 'VOID SHIPMENT';
        [InDataSet]
        LogInteractionEnable: Boolean;
        FromCaptionLbl: Label 'From:';
        ReceiveByCaptionLbl: Label 'Receive By';
        VendorIDCaptionLbl: Label 'Vendor ID';
        ConfirmToCaptionLbl: Label 'Confirm To';
        BuyerCaptionLbl: Label 'Buyer';
        ShipCaptionLbl: Label 'Ship';
        ToCaptionLbl: Label 'To:';
        ReturnShipmentCaptionLbl: Label 'RETURN SHIPMENT';
        ReturnShpNumberCaptionLbl: Label 'Return Shipment Number:';
        ReturnShipmentDateCaptionLbl: Label 'Return Shipment Date:';
        PageCaptionLbl: Label 'Page:';
        ShipViaCaptionLbl: Label 'Ship Via';
        RONumberCaptionLbl: Label 'R.O. Number';
        PurchaseCaptionLbl: Label 'Purchase';
        ItemNoCaptionLbl: Label 'Item No.';
        UnitCaptionLbl: Label 'Unit';
        DescriptionCaptionLbl: Label 'Description';
        ShippedCaptionLbl: Label 'Shipped';
        AuthorizedCaptionLbl: Label 'Authorized';
        ToBeShippedCaptionLbl: Label 'To Be Shipped';
        Item: Record Item;
        ReturnReason: Record "Return Reason";
        Condition: Text;

    local procedure GetSerialNos() SerialNos: Text
    var
        TempItemLedgEntry: Record "Item Ledger Entry" temporary;
        ItemTrackingMgt: Codeunit "Item Tracking Management";
    begin
        // Bell >>
        RetrieveEntriesFromShptRcpt(TempItemLedgEntry, DATABASE::"Return Shipment Line", 0,
          "Return Shipment Line"."Document No.", '', 0, "Return Shipment Line"."Line No.");
        if TempItemLedgEntry.FindSet then
            repeat
                if SerialNos <> '' then
                    SerialNos += ', ' + TempItemLedgEntry."Serial No."
                else
                    SerialNos := TempItemLedgEntry."Serial No.";
            until TempItemLedgEntry.Next = 0;
        // Bell <<
    end;

    local procedure RetrieveEntriesFromShptRcpt(var TempItemLedgEntry: Record "Item Ledger Entry" temporary; Type: Integer; Subtype: Integer; ID: Code[20]; BatchName: Code[10]; ProdOrderLine: Integer; RefNo: Integer)
    var
        ItemEntryRelation: Record "Item Entry Relation";
        ItemLedgEntry: Record "Item Ledger Entry";
        SignFactor: Integer;
    begin
        // retrieves a data set of Item Ledger Entries (Posted Shipments/Receipts)

        ItemEntryRelation.SetCurrentKey("Source ID", "Source Type");
        ItemEntryRelation.SetRange("Source Type", Type);
        ItemEntryRelation.SetRange("Source Subtype", Subtype);
        ItemEntryRelation.SetRange("Source ID", ID);
        ItemEntryRelation.SetRange("Source Batch Name", BatchName);
        ItemEntryRelation.SetRange("Source Prod. Order Line", ProdOrderLine);
        ItemEntryRelation.SetRange("Source Ref. No.", RefNo);
        if ItemEntryRelation.FindSet then begin
            SignFactor := -1;
            repeat
                ItemLedgEntry.Get(ItemEntryRelation."Item Entry No.");
                TempItemLedgEntry := ItemLedgEntry;
                AddTempRecordToSet(TempItemLedgEntry, SignFactor);
            until ItemEntryRelation.Next = 0;
        end;
    end;

    local procedure AddTempRecordToSet(var TempItemLedgEntry: Record "Item Ledger Entry" temporary; SignFactor: Integer)
    var
        TempItemLedgEntry2: Record "Item Ledger Entry" temporary;
        ItemTrackingMgt: Codeunit "Item Tracking Management";
    begin
        // Bell >>
        if SignFactor <> 1 then begin
            TempItemLedgEntry.Quantity *= SignFactor;
            TempItemLedgEntry."Remaining Quantity" *= SignFactor;
            TempItemLedgEntry."Invoiced Quantity" *= SignFactor;
        end;
        ItemTrackingMgt.RetrieveAppliedExpirationDate(TempItemLedgEntry);
        TempItemLedgEntry2 := TempItemLedgEntry;
        TempItemLedgEntry.Reset;
        TempItemLedgEntry.SetRange("Serial No.", TempItemLedgEntry2."Serial No.");
        TempItemLedgEntry.SetRange("Lot No.", TempItemLedgEntry2."Lot No.");
        TempItemLedgEntry.SetRange("Warranty Date", TempItemLedgEntry2."Warranty Date");
        TempItemLedgEntry.SetRange("Expiration Date", TempItemLedgEntry2."Expiration Date");
        if TempItemLedgEntry.FindFirst then begin
            TempItemLedgEntry.Quantity += TempItemLedgEntry2.Quantity;
            TempItemLedgEntry."Remaining Quantity" += TempItemLedgEntry2."Remaining Quantity";
            TempItemLedgEntry."Invoiced Quantity" += TempItemLedgEntry2."Invoiced Quantity";
            TempItemLedgEntry.Modify;
        end else
            TempItemLedgEntry.Insert;

        TempItemLedgEntry.Reset;
        // Bell <<
    end;
}

