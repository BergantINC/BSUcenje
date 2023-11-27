codeunit 65400 "TST Bonus Calculation"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvLineInsert', '', true, true)]
    local procedure RunOnAfterSalesInvLineInsert(var SalesInvLine: record "Sales Invoice Line")
    begin
        CalculateBonus(SalesInvLine);
    end;

    local procedure CalculateBonus(var SalesInvLine: record "Sales Invoice Line")
    var
        BonusHeader: record "TST Bonus Header";
    begin
        if SalesInvLine.Type <> SalesInvLine.Type::Item then
            exit;
        BonusHeader.SetRange("Customer no.", SalesInvLine."Bill-to Customer No.");
        BonusHeader.SetRange(Status, BonusHeader.Status::Released);
        BonusHeader.SetFilter("Starting date", '..%1', SalesInvLine."Posting Date");
        BonusHeader.SetFilter("Ending date", '%1..', SalesInvLine."Posting Date");

        if BonusHeader.FindSet() then
            repeat
                FindBonusAll(BonusHeader, SalesInvLine);
                FindBonusOne(BonusHeader, SalesInvLine);
            until bonusHeader.Next() = 0;
    end;

    local procedure FindBonusAll(var BonusHeader: record "TST Bonus Header"; var SalesInvLine: record "Sales Invoice Line")
    var
        BonusLine: Record "TST Bonus Line";
    begin
        BonusLine.SetRange("Document No.", BonusHeader."No.");
        BonusLine.SetRange(Type, BonusLine.Type::"All items");
        if BonusLine.FindFirst() then
            InsertIntoEntry(BonusLine, SalesInvLine);
    end;

    local procedure FindBonusOne(var BonusHeader: record "TST Bonus Header"; var SalesInvLine: record "Sales Invoice Line")
    var
        BonusLine: Record "TST Bonus Line";
    begin
        BonusLine.SetRange("Document No.", BonusHeader."No.");
        BonusLine.SetRange(Type, BonusLine.Type::Item);
        BonusLine.SetRange("Item No.", SalesInvLine."No.");
        if BonusLine.FindFirst() then
            InsertIntoEntry(BonusLine, SalesInvLine);
    end;

    local procedure InsertIntoEntry(var BonusLine: Record "TST Bonus Line"; var SalesInvLine: record "Sales Invoice Line")
    var
        BonusEntry: Record "TST Bonus Entry";
    begin
        BonusEntry.Init();
        BonusEntry."Entry No." := 0;
        BonusEntry."Bonus No." := BonusLine."Document No.";
        BonusEntry."Posting date" := SalesInvLine."Posting Date";
        BonusEntry."Item No." := SalesInvLine."No.";
        BonusEntry."Bonus Amount" := SalesInvLine."Line Amount" * (BonusLine."Bonus Perc." / 100);
        BonusEntry.Insert();
    end;

    var
}