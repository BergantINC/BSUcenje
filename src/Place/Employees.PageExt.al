pageextension 65403 "TST Employees" extends "Employee List"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("TST Work years"; Rec."TST Work years")
            {
                ApplicationArea = All;
                ToolTip = 'Years of employment';
                Caption = 'Years of employment';
            }
            field("TST Salary"; Rec."TST Salary")
            {
                ToolTip = 'Amount of money to receive';
                ApplicationArea = All;
            }
            field("Team Name"; Rec."Team Name")
            {
                ToolTip = 'The name of the team that the Employee belongs to';
                ApplicationArea = All;
            }
            field("Team Lead"; Rec."Team Lead")
            {
                ToolTip = 'Specifies if the Employee is a team lead or not';
                ApplicationArea = All;
            }
        }

    }



    actions
    {
        addfirst(processing)
        {
            action("Employee Info")
            {
                ApplicationArea = All;
                Image = Employee;
                Caption = 'Employee Info';

                trigger OnAction()
                var
                    Managment: Codeunit "TST Managment";
                    Employee: Record Employee;
                begin
                    CurrPage.SetSelectionFilter(Employee);
                    Employee.FindFirst();
                    Message(Managment.GetName(Employee) + '\' + Managment.GetSurname(Employee) + '\' + Managment.GetGender(Employee) + '\' + Format(Managment.GetBirthday(Employee)) +
                    '\' + Managment.GetMail(Employee) + '\' + Managment.GetTeam(Employee) + '\Age: %1', Managment.GetAge(Employee));
                end;
            }
        }
        addfirst(Promoted)
        {
            actionref("EmployeeInfo_Promoted"; "Employee Info") { }
        }
    }

    var
}