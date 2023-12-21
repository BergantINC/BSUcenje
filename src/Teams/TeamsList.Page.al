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
            action("Export Teams")
            {
                ApplicationArea = All;
                Image = Excel;
                Tooltip = 'Exports Teams to Excel.';
                trigger OnAction()
                begin
                    ExportExcelEntries();
                end;

            }
        }

        area(Promoted)
        {
            actionref("TestAction_Promoted"; "Team Lead") { }
            actionref("ExportTeams_Promoted"; "Export Teams") { }
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

    trigger OnOpenPage()
    var
        Json: Codeunit "TST Managment";
    begin
        Rec.FindFirst();
        if not Confirm('%1', false, Json.Rec2Json(Rec)) then exit;
    end;

    local procedure ExportExcelEntries()
    var
        ExcelBuffer: Record "Excel Buffer" temporary;
        MyRec: Record "TST Team Table";
        TeamFunc: Codeunit "TST Team Functionality";
    begin
        ExcelBuffer.Reset();
        ExcelBuffer.DeleteAll();
        ExcelBuffer.NewRow();

        ExcelBuffer.AddColumn(MyRec.FieldCaption(Name), false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(MyRec.FieldCaption(Task), false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Team Lead', false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);

        if MyRec.FindSet() then
            repeat
                ExcelBuffer.NewRow();
                ExcelBuffer.AddColumn(MyRec.Name, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                if (MyRec.Task = '') then
                    ExcelBuffer.AddColumn('/', false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text)
                else
                    ExcelBuffer.AddColumn(MyRec.Task, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(TeamFunc.FindLeadInTeamExcel(MyRec), false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
            until MyRec.Next() = 0;

        ExcelBuffer.CreateNewBook('Page1');
        ExcelBuffer.WriteSheet('Page1', CompanyName, UserId);
        ExcelBuffer.CloseBook();
        ExcelBuffer.SetFriendlyFilename('AllTeams');
        ExcelBuffer.OpenExcel();
    end;
}