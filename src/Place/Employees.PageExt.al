pageextension 65403 "TST Employees" extends "Employee List"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("TST Work years"; Rec."TST Work years")
            {
                ApplicationArea = All;
                ToolTip = 'Years of employment';
                Caption = 'Years of employment';
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
            field("Team Lead"; Rec."Team Lead")
            {
                ToolTip = 'Specifies if the Employee is a team lead or not';
                ApplicationArea = All;
            }
        }

    }



    actions
    {
        // Add changes to page actions here
    }

    var
}