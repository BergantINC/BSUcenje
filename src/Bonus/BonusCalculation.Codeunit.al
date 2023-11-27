codeunit 65400 "TST Bonus Calculation"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvLineInsert', '', true, true)]
    local procedure RunOnAfterSalesInvLineInsert(var SalesInvLine: record "Sales Invoice Line")
    begin
        CalculateBonus(SalesInvLine);
    end;

    local procedure CalculateBonus(var TSTSalesInvLine: record "Sales Invoice Line")
    var
        TSTBonusHeader: record "TST Bonus Header";
    begin
        if TSTSalesInvLine.Type <> TSTSalesInvLine.Type::Item then
            exit;
        TSTBonusHeader.SetRange("Customer no.", TSTSalesInvLine."Bill-to Customer No.");
        TSTBonusHeader.SetRange(Status, TSTBonusHeader.Status::Released);
        TSTBonusHeader.SetFilter("Starting date", '..%1', TSTSalesInvLine."Posting Date");
        TSTBonusHeader.SetFilter("Ending date", '%1..', TSTSalesInvLine."Posting Date");

        if TSTBonusHeader.FindSet() then
            repeat
                FindBonusAll(TSTBonusHeader, TSTSalesInvLine);
                FindBonusOne(TSTBonusHeader, TSTSalesInvLine);
            until TSTBonusHeader.Next() = 0;
    end;

    local procedure FindBonusAll(var TSTBonusHeader: record "TST Bonus Header"; var TSTSalesInvLine: record "Sales Invoice Line")
    var
        TSTBonusLine: Record "TST Bonus Line";
    begin
        TSTBonusLine.SetRange("Document No.", TSTBonusHeader."No.");
        TSTBonusLine.SetRange(Type, TSTBonusLine.Type::"All items");
        if TSTBonusLine.FindFirst() then
            InsertIntoEntry(TSTBonusLine, TSTSalesInvLine);
    end;

    local procedure FindBonusOne(var TSTBonusHeader: record "TST Bonus Header"; var TSTSalesInvLine: record "Sales Invoice Line")
    var
        TSTBonusLine: Record "TST Bonus Line";
    begin
        TSTBonusLine.SetRange("Document No.", TSTBonusHeader."No.");
        TSTBonusLine.SetRange(Type, TSTBonusLine.Type::Item);
        TSTBonusLine.SetRange("Item No.", TSTSalesInvLine."No.");
        if TSTBonusLine.FindFirst() then
            InsertIntoEntry(TSTBonusLine, TSTSalesInvLine);
    end;

    local procedure InsertIntoEntry(var TSTBonusLine: Record "TST Bonus Line"; var TSTSalesInvLine: record "Sales Invoice Line")
    var
        TSTBonusEntry: Record "TST Bonus Entry";
    begin
        TSTBonusEntry.Init();
        TSTBonusEntry."Entry No." := 0;
        TSTBonusEntry."Bonus No." := TSTBonusLine."Document No.";
        TSTBonusEntry."Posting date" := TSTSalesInvLine."Posting Date";
        TSTBonusEntry."Item No." := TSTSalesInvLine."No.";
        TSTBonusEntry."Bonus Amount" := TSTSalesInvLine."Line Amount" * (TSTBonusLine."Bonus Perc." / 100);
        TSTBonusEntry.Insert();
    end;

    var
}