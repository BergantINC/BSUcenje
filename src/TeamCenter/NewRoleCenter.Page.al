page 65410 "TST New Role Center"
{
    PageType = RoleCenter;
    Caption = 'Multisola';

    layout
    {
        area(RoleCenter)
        {
            part(Headline; "Headline RC Administrator")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Activities; "Team Member Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part("Help And Chart Wrapper"; "Help And Chart Wrapper")
            {
                ApplicationArea = Basic, Suite;
            }
            part("Report Inbox Part"; "Report Inbox Part")
            {
                ApplicationArea = Basic, Suite;
            }
            part("Power BI Report Spinner Part"; "Power BI Report Spinner Part")
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(Creation)
        {

        }
        area(Processing)
        {
            group(New)
            {
                action("Customer List")
                {
                    RunPageMode = Create;
                    Caption = 'AppNameMasterData';
                    ToolTip = 'Register new AppNameMasterData';
                    RunObject = page "Customer List";
                    Image = DataEntry;
                    ApplicationArea = Basic, Suite;
                }
            }
            group("ACC Managment Group")
            {
                action("ACC Managment")
                {
                    Caption = 'ACC Managment';
                    ToolTip = 'ACC Managment description';
                    Image = Process;
                    RunObject = Codeunit AccSchedManagement;
                    ApplicationArea = Basic, Suite;
                }
            }
            group("Reports")
            {
                action("Analysis Report")
                {
                    Caption = 'Analysis Report';
                    ToolTip = 'Analysis Report description';
                    Image = Report;
                    RunObject = report "Analysis Report";
                    ApplicationArea = Basic, Suite;
                }
            }
        }
        area(Reporting)
        {
            action("Account Schedule")
            {
                Caption = 'Account Schedule';
                ToolTip = 'Account Schedule description';
                Image = Report;
                RunObject = report "Account Schedule";
                ApplicationArea = Basic, Suite;
            }

        }
        area(Embedding)
        {
            action("Data Migration")
            {
                RunObject = page "Data Migrators";
                ApplicationArea = Basic, Suite;
            }
            action("Employee List")
            {
                RunPageMode = View;
                Caption = 'Employee List';
                ToolTip = 'Employee List';
                Image = New;
                RunObject = page "Employee List";
                ApplicationArea = Basic, Suite;
            }
            action("Report Selection")
            {
                RunObject = page "TST Report Selection Quality";
                ApplicationArea = Basic, Suite;
            }
            action("Teams")
            {
                RunObject = page "TST Team List";
                ApplicationArea = Basic, Suite;
            }

        }
        area(Sections)
        {
            group(Setup)
            {
                Caption = 'Setup';
                ToolTip = 'Overview and change system and application settings, and manage extensions and services';
                Image = Setup;

                action("API Setup")
                {
                    ToolTip = 'Setup API';
                    RunObject = Page "API Setup";
                    ApplicationArea = Basic, Suite;

                }

                action("Assisted Setup")
                {
                    ToolTip = 'Set up core functionality such as sales tax, sending documents as email, and approval workflow by running through a few pages that guide you through the information.';
                    RunObject = Page "Assisted Setup";
                    ApplicationArea = Basic, Suite;
                }
                action("VAT Setup")
                {
                    ToolTip = 'Define your company policies for business departments and for general activities by filling setup windows manually.';
                    RunObject = Page "VAT Setup";
                    ApplicationArea = Basic, Suite;
                }
                action("Service Connections")
                {
                    ToolTip = 'Enable and configure external services, such as exchange rate updates, Microsoft Social Engagement, and electronic bank integration.';
                    RunObject = Page "Service Connections";
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

}