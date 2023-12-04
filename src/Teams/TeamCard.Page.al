page 65407 "TST Team Card"
{
    Caption = 'Team Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "TST Team Table";



    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Team"; Rec."Name")
                {
                    ApplicationArea = All;
                    //Editable = true;
                    ToolTip = 'Specifies the value of the Name field.';
                    Editable = false;
                }
                field("Task"; Rec.Task)
                {
                    ApplicationArea = All;
                    //Editable = true;
                    ToolTip = 'Specifies the value of the Task field.';
                    Editable = false;
                }
            }
            part("Team Members"; "TST Team Subform")
            {
                Editable = true;
                ApplicationArea = All;
                caption = 'Team Members';
                SubPageLink = "Team Name" = field("Name");
            }

        }
    }

    actions
    {
        area(Navigation)
        {
            action("Show Employee")
            {
                ApplicationArea = All;
                Image = Employee;
                ToolTip = 'Finds the selected employee';
                trigger OnAction()
                var
                    TeamFunc: Codeunit "TST Team Functionality";
                    Employee: Record Employee;
                    Subform: Page "TST Team Subform";
                begin
                    Subform.SetSelectionFilter(Employee);
                    Employee.FindFirst();
                    TeamFunc.FindEmployee(Employee);
                end;
            }
        }
    }
}