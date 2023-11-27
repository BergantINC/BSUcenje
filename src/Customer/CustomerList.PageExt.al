pageextension 65400 "TST Customer List" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("TST No. of Bonuses"; Rec."TST Bonuses")
            {
                ApplicationArea = All;
                ToolTip = 'Bonuses to customer';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addlast(navigation)
        {
            action(TSTBonuses)
            {
                ApplicationArea = All;
                Caption = 'Bonuses';
                tooltip = 'List of bonuses';
                Image = Discount;
                RunObject = page "TST Bonus List";
                RunPageLink = "Customer no." = field("No.");
                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
}