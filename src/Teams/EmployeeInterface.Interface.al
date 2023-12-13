interface EmployeeInterface
{
    procedure GetName(Employee: Record Employee): Text;

    procedure GetSurname(Employee: Record Employee): Text;

    procedure GetGender(Employee: Record Employee): Text;

    procedure GetMail(Employee: Record Employee): Text;

    procedure GetBirthday(Employee: Record Employee): Date;

    procedure GetTeam(Employee: Record Employee): Text;

    procedure GetAge(Employee: Record Employee): Decimal;
}