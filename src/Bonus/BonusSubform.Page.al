page 65402 "TST Bonus Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Lines';
    SourceTable = "TST Bonus Line";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Type"; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Hehehe1';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Hehehe2';
                }
                field("Bonus Perc."; Rec."Bonus Perc.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Hehehe3';
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

    var
}