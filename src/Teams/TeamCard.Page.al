page 65407 "TST Team Card"
{
    Caption = 'Team Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "TST Team Table";
    Editable = false;


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
                }
                field("Task"; Rec.Task)
                {
                    ApplicationArea = All;
                    //Editable = true;
                    ToolTip = 'Specifies the value of the Task field.';
                }
            }
            part("Team Members"; "TST Team Subform")
            {
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
        }
    }
}