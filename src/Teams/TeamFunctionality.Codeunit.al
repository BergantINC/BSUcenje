codeunit 65401 "TST Team Functionality"
{
    procedure OnlyOneLead(var SelectedTeams: Record "TST Team Table")
    var
    begin
        FindLeadInTeam(SelectedTeams);
    end;

    procedure FindEmployee(var Employee: Record Employee)
    begin
        FindSelectedEmployee(Employee);
    end;

    procedure FindMe(var Team: record "TST Team Table"): boolean
    begin
        exit(FindMeLocal(Team));
    end;

    procedure BussiestTeam(var Team: Record "TST Team Table"): Integer
    begin
        exit(BussiestTeamLocal(Team));
    end;

    procedure OpenTask()
    begin

    end;

    local procedure FindMeLocal(var Team: record "TST Team Table"): boolean
    var
        EmployeeMe: Record Employee;
        Msg: Label 'Is it me?: %1';
    begin
        EmployeeMe.SetFilter("Search Name", 'NEJC BERGANT NB');
        EmployeeMe.FindFirst();
        //Message(Msg, EmployeeMe);
        if EmployeeMe."First Name" = 'Nejc' then
            exit(true);
        exit;
    end;

    local procedure FindLeadInTeam(var Team: Record "TST Team Table")
    var
        Employee: Record Employee;
        ErrMore: Label 'Error: More than one Team Lead, please select only THE CHOSEN ONE!';
        ErrLess: Label 'Error: Less than one Team Lead, please select THE CHOSEN ONE!';
    begin
        Employee.SetFilter("Team Name", Team.Name);
        Employee.SetRange("Team Lead", true);

        if Employee.FindSet() then begin
            if Employee.Count > 1 then Error(ErrMore);
            if Employee.Count < 1 then Error(ErrLess);
            repeat
                if not Confirm('Employee in %1: %2 %3 %4', false, Team.name, Employee."No.", Employee."First Name", Employee."Last Name") then exit;
            until Employee.Next() = 0;
        end else
            Error('Error: The team is empty, assign THE CHOSEN ONES to it, then assign one member to be a Team Lead!');
    end;

    local procedure BussiestTeamLocal(var Team: Record "TST Team Table"): Integer
    var
        Tasks: Record "To-do";
        tempNum: integer;
    begin
        tempNum := 0;
        Tasks.SetRange(Tasks."Team Code 2", Team.Name);
        if Tasks.FindSet() then begin
            repeat
                tempNum := tempNum + 1;
            until Tasks.Next() = 0;
        end;
        exit(tempNum);
    end;

    local procedure FindSelectedEmployee(var Employee: Record Employee) //Doesnt work as intended (at all)
    var
    begin
        Message('The selected Employee: %1', Employee);
    end;
}