page 65401 "TST bonus card"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = None;
    Caption = 'Bonus card';
    SourceTable = "TST Bonus Header";


    layout
    {
        area(Content)
        {

            group(General)
            {
                field("No."; rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Ne vem1';
                    ApplicationArea = All;

                }
                field("Customer no."; rec."Customer no.")
                {
                    Caption = 'Customer no.';
                    ToolTip = 'Ne vem2';
                    ApplicationArea = All;

                }
                field("Starting date"; rec."Starting date")
                {
                    Caption = 'Starting date';
                    ToolTip = 'Ne vem3';
                    ApplicationArea = All;

                }
                field("Ending date"; rec."Ending date")
                {
                    Caption = 'Ending date';
                    ToolTip = 'Ne vem4';
                    ApplicationArea = All;

                }
                field("Status"; rec.Status)
                {
                    Caption = 'Status';
                    ToolTip = 'Ne vem5';
                    ApplicationArea = All;

                }

            }
            part(Lines; "TST Bonus Subform")
            {
                ApplicationArea = All;
                caption = 'Lines';
                SubPageLink = "Document No." = field("No.");
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
                tooltip = 'neki ze naredi :^)';
                Image = Customer;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer no.");
            }
            action(BonusEntries)
            {
                ApplicationArea = All;
                Caption = 'Bonus Entries';
                tooltip = 'Gets all the bonus entries made';
                Image = Entries;
                RunObject = page "TST Bonus Entries";
                RunPageLink = "Bonus No." = field("No.");
            }
        }
    }
}