codeunit 65400 "TST Bonus Calculation"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvLineInsert', '', true, true)]
    local procedure RunOnAfterSalesInvLineInsert(var SalesInvLine: record "Sales Invoice Line")
    begin
        CalculateBonus(SalesInvLine);
    end;

    local procedure CalculateBonus(var SalesInvoiceLine: record "Sales Invoice Line")
    var
        TSTBonusHeader: record "TST Bonus Header";
    begin
        if SalesInvoiceLine.Type <> SalesInvoiceLine.Type::Item then
            exit;
        TSTBonusHeader.SetRange("Customer no.", SalesInvoiceLine."Bill-to Customer No.");
        TSTBonusHeader.SetRange(Status, TSTBonusHeader.Status::Released);
        TSTBonusHeader.SetFilter("Starting date", '..%1', SalesInvoiceLine."Posting Date");
        TSTBonusHeader.SetFilter("Ending date", '%1..', SalesInvoiceLine."Posting Date");

        if TSTBonusHeader.FindSet() then
            repeat
                FindBonusAll(TSTBonusHeader, SalesInvoiceLine);
                FindBonusOne(TSTBonusHeader, SalesInvoiceLine);
            until TSTBonusHeader.Next() = 0;
    end;

    local procedure FindBonusAll(var TSTBonusHeader: record "TST Bonus Header"; var SalesInvoiceLine: record "Sales Invoice Line")
    var
        TSTBonusLine: Record "TST Bonus Line";
    begin
        TSTBonusLine.SetRange("Document No.", TSTBonusHeader."No.");
        TSTBonusLine.SetRange(Type, TSTBonusLine.Type::"All items");
        if TSTBonusLine.FindFirst() then
            InsertIntoEntry(TSTBonusLine, SalesInvoiceLine);
    end;

    local procedure FindBonusOne(var TSTBonusHeader: record "TST Bonus Header"; var SalesInvoiceLine: record "Sales Invoice Line")
    var
        TSTBonusLine: Record "TST Bonus Line";
    begin
        TSTBonusLine.SetRange("Document No.", TSTBonusHeader."No.");
        TSTBonusLine.SetRange(Type, TSTBonusLine.Type::Item);
        TSTBonusLine.SetRange("Item No.", SalesInvoiceLine."No.");
        if TSTBonusLine.FindFirst() then
            InsertIntoEntry(TSTBonusLine, SalesInvoiceLine);
    end;

    local procedure InsertIntoEntry(var TSTBonusLine: Record "TST Bonus Line"; var SalesInvoiceLine: record "Sales Invoice Line")
    var
        TSTBonusEntry: Record "TST Bonus Entry";
    begin
        TSTBonusEntry.Init();
        TSTBonusEntry."Entry No." := 0;
        TSTBonusEntry."Bonus No." := TSTBonusLine."Document No.";
        TSTBonusEntry."Posting date" := SalesInvoiceLine."Posting Date";
        TSTBonusEntry."Item No." := SalesInvoiceLine."No.";
        TSTBonusEntry."Bonus Amount" := SalesInvoiceLine."Line Amount" * (TSTBonusLine."Bonus Perc." / 100);
        TSTBonusEntry.Insert();
    end;

    var
}