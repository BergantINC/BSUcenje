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

    procedure OpenTask()
    begin

    end;

    local procedure FindLeadInTeam(var Team: Record "TST Team Table")
    var
        Employee: Record Employee;
    begin
        Employee.SetFilter("Team Name", Team.Name);
        Employee.SetRange("Team Lead", true);

        if Employee.FindSet() then begin
            if Employee.Count > 1 then Error('Error: More than one Team Lead, please select only THE CHOSEN ONE!');
            if Employee.Count < 1 then Error('Error: Less than one Team Lead, please select THE CHOSEN ONE!');
            repeat
                if not Confirm('Employee in %1: %2 %3 %4', false, Team.name, Employee."No.", Employee."First Name", Employee."Last Name") then exit;
            until Employee.Next() = 0;
        end else
            Error('Error: The team is empty, assign THE CHOSEN ONES to it, then assign one member to be a Team Lead!');
    end;

    local procedure FindSelectedEmployee(var Employee: Record Employee)
    var
    begin
        Message('The selected Employee: %1', Employee);
    end;
}