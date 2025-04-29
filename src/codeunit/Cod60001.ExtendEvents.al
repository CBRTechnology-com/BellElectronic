codeunit 60001 ExtendEvents
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnRegisterChangeOnAfterCreateReservEntry', '', true, true)]
    local procedure ReserveEntry(VAR ReservEntry: Record "Reservation Entry"; TrackingSpecification: Record "Tracking Specification")
    begin
        ReservEntry."Alternate Serial Number" := TrackingSpecification."Alternate Serial Number";
        ReservEntry."Owner Type" := TrackingSpecification."Owner Type";
        ReservEntry.Status := TrackingSpecification.Status;
        ReservEntry."Item Comment" := TrackingSpecification."Item Comment";
        ReservEntry."Last Inventoried Date" := TrackingSpecification."Last Inventoried Date";
        reservEntry."Item Location" := TrackingSpecification."Item Location";
        ReservEntry.Modify();

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertSetupTempSplitItemJnlLine', '', true, true)]
    local procedure CU22(VAR TempTrackingSpecification: Record "Tracking Specification"; VAR TempItemJournalLine: Record "Item Journal Line"; VAR PostItemJnlLine: Boolean)
    begin
        TempItemJournalLine."Alternate Serial Number" := TempTrackingSpecification."Alternate Serial Number";
        TempItemJournalLine."Owner Type" := TempTrackingSpecification."Owner Type";
        TempItemJournalLine.Status := TempTrackingSpecification.Status;
        TempItemJournalLine."Item Comment" := TempTrackingSpecification."Item Comment";
        TempItemJournalLine."Last Inventoried Date" := TempTrackingSpecification."Last Inventoried Date";
        TempItemJournalLine."Item Location" := TempTrackingSpecification."Item Location";

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure CU22IJLtoILE(var NewItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line")
    begin
        NewItemLedgEntry."Alternate Serial Number" := ItemJournalLine."Alternate Serial Number";
        NewItemLedgEntry."Owner Type" := ItemJournalLine."Owner Type";
        NewItemLedgEntry.Status := ItemJournalLine.Status;
        NewItemLedgEntry."Item Comment" := ItemJournalLine."Item Comment";
        NewItemLedgEntry."Last Inventoried Date" := ItemJournalLine."Last Inventoried Date";
        NewItemLedgEntry."Item Location" := ItemJournalLine."Item Location";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WMS Management", 'OnInitWhseJnlLineCopyFromItemJnlLine', '', true, true)]
    local procedure CU7302WJL(VAR WarehouseJournalLine: Record "Warehouse Journal Line"; ItemJournalLine: Record "Item Journal Line")
    begin
        WarehouseJournalLine."Alternate Serial Number" := ItemJournalLine."Alternate Serial Number";
        WarehouseJournalLine."Owner Type" := ItemJournalLine."Owner Type";
        WarehouseJournalLine.Status := ItemJournalLine.Status;
        WarehouseJournalLine."Item Comment" := ItemJournalLine."Item Comment";
        WarehouseJournalLine."Last Inventoried Date" := ItemJournalLine."Last Inventoried Date";
        WarehouseJournalLine."Item Location" := ItemJournalLine."Item Location";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse. Jnl.-Register Line", 'OnInitWhseEntryCopyFromWhseJnlLine', '', true, true)]
    local procedure CU7301WJRL(VAR WarehouseEntry: Record "Warehouse Entry"; WarehouseJournalLine: Record "Warehouse Journal Line")
    begin
        WarehouseEntry."Alternate Serial Number" := WarehouseJournalLine."Alternate Serial Number";
        WarehouseEntry."Owner Type" := WarehouseJournalLine."Owner Type";
        WarehouseEntry.Status := WarehouseJournalLine.Status;
        WarehouseEntry."Item Comment" := WarehouseJournalLine."Item Comment";
        WarehouseEntry."Last Inventoried Date" := WarehouseJournalLine."Last Inventoried Date";
        WarehouseEntry."Item Location" := WarehouseJournalLine."Item Location";
    end;

    [EventSubscriber(ObjectType::Table, database::"Sales Header", 'OnAfterCopySellToCustomerAddressFieldsFromCustomer', '', true, true)]
    local procedure T36CopyCusttoSalesHeader(VAR SalesHeader: Record "Sales Header"; SellToCustomer: Record Customer)
    begin
        SalesHeader."Shipper Acct No." := SellToCustomer."Shipper Acct No.";
        SalesHeader."Payment Account" := SellToCustomer."Preferred Bank Account Code";

    end;

    [EventSubscriber(ObjectType::Table, database::"Transfer Shipment Header", 'OnAfterCopyFromTransferHeader', '', true, true)]
    local procedure T5740TransferToShip(VAR TransferShipmentHeader: Record "Transfer Shipment Header"; TransferHeader: Record "Transfer Header")
    begin
        TransferShipmentHeader."Customer ID" := TransferHeader."Customer ID";
        TransferShipmentHeader."Ship To Code" := TransferHeader."Ship To Code";
    end;

    [EventSubscriber(ObjectType::Table, database::"Transfer Receipt Header", 'OnAfterCopyFromTransferHeader', '', true, true)]
    local procedure T5740TransferToReceipt(VAR TransferReceiptHeader: Record "Transfer Receipt Header"; TransferHeader: Record "Transfer Header")
    begin
        TransferReceiptHeader."Customer ID" := TransferHeader."Customer ID";
        TransferReceiptHeader."Ship To Code" := TransferHeader."Ship To Code";
    end;

    var
        myInt: Integer;
}