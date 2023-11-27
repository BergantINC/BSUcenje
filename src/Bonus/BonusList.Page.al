page 65400 "TST Bonus List"
{
    PageType = List;
    Editable = false;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "TST Bonus Header";
    Caption = 'Bonuses';
    CardPageId = "TST bonus card";

    layout
    {
        area(Content)
        {
            repeater("TST Bonus Header")
            {
                field("No."; rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                    ToolTip = 'Ne vem1';
                }
                field("Customer no."; rec."Customer no.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Ne vem2';
                }
                field("Starting date"; rec."Starting date")
                {
                    Caption = 'Starting date';
                    ApplicationArea = All;
                    ToolTip = 'Ne vem3';
                }
                field("Ending date"; rec."Ending date")
                {
                    Caption = 'Ending date';
                    ApplicationArea = All;
                    ToolTip = 'Ne vem4';
                }
                field("Status"; rec.Status)
                {
                    Caption = 'Status';
                    ApplicationArea = All;
                    ToolTip = 'Ne vem5';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(CustomerCard)
            {
                ApplicationArea = All;
                Caption = 'Customer Card';
                Image = Customer;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer no.");
                ToolTip = 'Executes the Customer Card action.';
            }

            action(BonusEntries)
            {
                ApplicationArea = All;
                Caption = 'Bonus Entries';
                Image = Entries;
                RunObject = page "TST Bonus Entries";
                RunPageLink = "Bonus No." = field("No.");
                ToolTip = 'Executes the Bonus Entries action.';
            }
        }
    }

    var
}