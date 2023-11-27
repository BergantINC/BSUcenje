pageextension 65405 "TST Employee Card" extends "Employee Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("TST Work years"; Rec."TST Work years")
            {
                ToolTip = 'Years of employment';
                ApplicationArea = All;
            }
            field("TST Salary"; Rec."TST Salary")
            {
                ToolTip = 'Amount of money to receive';
                ApplicationArea = All;
            }
            field("Team Name"; Rec."Team Name")
            {
                ToolTip = 'The name of the team that the Employee belongs to';
                ApplicationArea = All;
            }
        }

        addlast(factboxes)
        {
            part("EmployeeFactBox"; "TST Employee FactBox")
            {
                ApplicationArea = all;
                SubPageLink = "No." = field("No.");
            }
        }
    }



    actions
    {
        // Add changes to page actions here
    }


    var
}