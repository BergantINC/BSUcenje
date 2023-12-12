page 65408 "TST Team Subform"
{
    Caption = 'Caption';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Employee;
    //CardPageId = "Employee Card";
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    TableRelation = Employee."No.";
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
                field("Team Name"; Rec."Team Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'The team that the employee belongs to';
                }
                field("Team Lead"; Rec."Team Lead")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Is the employee a team lead';
                }
            }
            usercontrol(Comm; InterPageCommunication)
            {

            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.Comm.PingParentPage();
    end;
}

controladdin InterPageCommunication
{
    Scripts = 'src/Teams/interPageCommunication.js';
    event PingFromSubPage();
    procedure PingParentPage();
}