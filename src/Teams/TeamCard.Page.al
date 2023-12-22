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
                    Editable = true;
                }
                field("Task"; Rec.Task)
                {
                    ApplicationArea = All;
                    //Editable = true;
                    ToolTip = 'Specifies the value of the Task field.';
                    Editable = false;
                }

            }
            usercontrol(Comm; InterPageCommunication)
            {
                ApplicationArea = All;
                trigger PingFromSubPage()
                begin
                    Message('Hello from subpage!');
                end;
            }
            part("Team Members"; "TST Team Subform")
            {
                Editable = true;
                ApplicationArea = All;
                caption = 'Team Members';
                SubPageLink = "Team Name" = field("Name");
            }

            part("Mail Form"; "TST Send Mail")
            {
                ApplicationArea = All;
                Caption = 'Mail Form';
            }

        }

        area(FactBoxes)
        {
            part("Team Spirit"; "TST Team Spirit")
            {
                ApplicationArea = BasicHR;
                SubPageLink = "Name" = field("Name");
                Editable = false;
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
                    Employee: Record Employee;
                    TeamFunc: Codeunit "TST Team Functionality";
                    Subform: Page "TST Team Subform";
                begin
                    Subform.SetSelectionFilter(Employee);
                    Employee.FindFirst();
                    TeamFunc.FindEmployee(Employee);
                end;
            }
            action("Set Image")
            {
                ApplicationArea = All;
                Image = ImplementRegAbsence;
                trigger OnAction()
                var
                    Management: codeunit "TST Managment";
                begin
                    Management.SetImage(Rec);
                    CurrPage.Update(false);
                end;
            }
        }

        area(Promoted)
        {
            actionref("ShowEmployee_Promoted"; "Show Employee") { }
            actionref("SetImage_Promoted"; "Set Image") { }
        }
    }
}