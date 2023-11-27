page 65405 "TST Report Selection card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "TST Report Selection Table";



    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Report ID"; Rec."Report ID")
                {
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Report ID field.';
                    ShowMandatory = true;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies to which Employee the report belongs to';
                    Editable = true;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("Usage fix"; Rec."Usage fix")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Usage field.';
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
            action(Employees)
            {
                Caption = 'Employees';
                ApplicationArea = All;
                ToolTip = 'Opens the Employees list';
                Image = Employee;
                RunObject = Page "Employee List";
            }
        }

        area(Promoted)
        {
            actionref("Employees_Promoted"; Employees)
            {

            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
    begin
        SetDateTime();
    end;

    trigger OnClosePage()
    begin
        Rec.SetRange("Report ID", Rec."Report ID");
        Rec."Last modified" := CurrentDateTime;
        Rec.Validate("Last modified", CurrentDateTime);
        Rec.MODIFY();

    end;

    trigger OnModifyRecord(): Boolean
    begin
        Rec.TestField("Employee No.");
    end;

    local procedure SetDateTime()
    var
    begin
        Rec."Creation time" := CurrentDateTime;
    end;

    var
}