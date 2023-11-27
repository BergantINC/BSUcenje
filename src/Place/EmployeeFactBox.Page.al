page 65409 "TST Employee FactBox"
{
    Caption = 'Employee FactBox';
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = Employee;

    layout
    {
        area(Content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the employee''s code/Number.';
            }
            group(Control1)
            {
                ShowCaption = false;

                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s date of birth.';
                }
                field("Union Code"; Rec."Union Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s labor union membership code.';
                }
                field("Social Security No."; Rec."Social Security No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the social security number of the employee.';
                }
                field("Union Membership No."; Rec."Union Membership No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s labor union membership number.';
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