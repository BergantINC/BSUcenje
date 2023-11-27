page 65404 "TST Report Selection Quality"
{
    Caption = 'Report Selection Quality';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "TST Report Selection Table";
    CardPageId = "TST Report Selection card";
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater("TST Report Selection Table")
            {
                field("Report ID"; Rec."Report ID")
                {
                    ApplicationArea = All;
                    Enabled = true;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Report ID field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies to which Employee the report belongs to';

                }
                field("Usage fix"; Rec."Usage fix")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Usage field.';
                    Enabled = true;
                    Editable = true;
                }
                field("Report Caption"; Rec."Report Caption")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Report Caption field.';
                }
                field("Sequence"; Rec.Sequence)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sequence field.';
                }
                field("Creation time"; Rec."Creation time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Creation time field.';

                }
                field("Last modified"; Rec."Last modified")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when the data was last modified';

                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(ReportCard)
            {
                ApplicationArea = All;
                Caption = 'Report Card';
                Image = Report;
                RunObject = page "TST Report Selection card";
                RunPageLink = "Report ID" = field("Report ID");
                ToolTip = 'Executes the Report Card action.';
            }
        }



        area(Promoted)
        {
            actionref("ReportCard_Promoted"; ReportCard)
            {

            }
        }
    }
}