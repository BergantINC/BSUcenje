codeunit 65404 "TST Managment" implements EmployeeInterface
{
    procedure GetName(Employee: Record Employee): Text
    begin
        exit(Employee."First Name");
    end;

    procedure GetSurname(Employee: Record Employee): Text
    begin
        exit(Employee."Last Name");
    end;

    procedure GetGender(Employee: Record Employee): Text
    begin
        exit(Format(Employee.Gender));
    end;

    procedure GetMail(Employee: Record Employee): Text
    begin
        if Employee."Company E-Mail" <> '' then
            exit(Employee."Company E-Mail");
        exit(Employee."E-Mail");
    end;

    procedure GetBirthday(Employee: Record Employee): Date
    begin
        exit(Employee."Birth Date");
    end;

    procedure GetTeam(Employee: Record Employee): Text
    begin
        exit(Employee."Team Name");
    end;

    procedure GetAge(Employee: Record Employee): Decimal
    begin
        exit(round((Today() - GetBirthday(Employee)) / 365));
    end;
}