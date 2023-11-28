report 65400 "TST Report Selection DO"
{
    Caption = 'Report Selection';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportSelectionQuality.rdl';

    dataset
    {
        dataitem("Report Selection Table"; "TST Report Selection Table")
        {
            RequestFilterFields = "Report ID", "Employee No.";
            column(Report_ID; "Report ID")
            {

            }
            column(Employee_No_; "Employee No.")
            {

            }
            column(Usage_fix; Usage)
            {

            }
            column(Report_Caption; "Report Caption")
            {

            }
            column(Sequence; Sequence)
            {

            }
            column(Creation_time; "Creation time")
            {

            }
            column(Last_modified; "Last modified")
            {

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }
    }
}