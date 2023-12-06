codeunit 65403 "TST All Events"
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TST Published Events", 'Hello', '', true, true)]
    local procedure MyProcedure()
    begin
        Message('hello World ;^)!');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TST Published Events", 'CountEmployees', '', true, true)]
    local procedure CountEmployees()
    var
        Employee: Record Employee;
        Msg: Label 'The number of employed personal is: %1';
        ct: integer;
    begin
        ct := 0;
        if Employee.FindSet() then begin
            repeat
                ct := ct + 1;
            until Employee.Next() = 0;
        end;
        if not Confirm(Msg, false, ct) then
            exit;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TST Published Events", 'Prompt', '', true, true)]
    local procedure Prompt()
    begin
        if not Confirm('Are you sure you want to do this? (I dont know what this is ;^) ) ', false) then
            exit;
        Page.Run(65412);
    end;
}