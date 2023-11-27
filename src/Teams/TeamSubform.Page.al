page 65408 "TST Team Subform"
{
    Caption = 'Caption';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Employee;
    CardPageId = "Employee Card";


    layout
    {
        area(Content)
        {
            repeater(Employee)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    TableRelation = Employee;
                    DrillDownPageId = "Employee Card";
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the employee''s first name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the employee''s last name.';
                }
                field("Gender"; Rec.Gender)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the gender with which the employee identifies.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the employee''s job title.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
        }
    }
}