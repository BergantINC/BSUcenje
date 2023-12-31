page 65406 "TST Team List"
{
    Caption = 'Team List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "TST Team Table";
    CardPageId = "TST Team Card";

    layout
    {
        area(Content)
        {
            repeater("TST Team Table")
            {
                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                    ToolTip = 'Specifies the value of the Name field.';
                    //DrillDownPageId = "TST Team Card";
                }
                field("Task"; Rec.Task)
                {
                    ApplicationArea = All;
                    caption = 'Task';
                    ToolTip = 'Specifies the value of the Task field.';
                }
            }
        }
        area(Factboxes)
        {

        }
    }
    actions
    {
        area(Navigation)
        {
            action("Team Lead")
            {
                ApplicationArea = All;
                Image = TeamSales;
                ToolTip = 'Executes the TestAction action.';
                trigger OnAction()
                var
                    Team: Record "TST Team Table";
                    TeamFunc: Codeunit "TST Team Functionality";
                begin
                    CurrPage.SetSelectionFilter(Team);
                    Team.FindFirst();
                    TeamFunc.OnlyOneLead(Team);
                end;
            }
        }

        area(Promoted)
        {
            actionref("TestAction_Promoted"; "Team Lead") { }
        }
    }

    trigger OnClosePage()
    var
        TeamSet: Record "TST Team Table";
    begin
        if TeamSet.Find('-') then
            repeat
                if not Confirm('Thou hast found the record of team %1', false, TeamSet) then exit;
            until TeamSet.Next() = 0;


    end;
}