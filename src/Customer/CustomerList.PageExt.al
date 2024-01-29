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
            action("Add Selected")
            {
                Caption = 'Add Selected';
                ApplicationArea = All;
                Image = AddAction;
                //RunObject = Page "Customer Bank Account List";
                //RunPageMode = View;

                trigger OnAction()
                var
                    App: Record "Customer Bank Account";
                    Apps: Page "Customer Bank Account List";
                begin
                    if Apps.RunModal() = "Action"::OK then begin
                        Apps.SetSelectionFilter(App);
                        App.MarkedOnly(true);
                        if App.FindSet() then begin
                            repeat
                                TestText := TestText + App.Name;
                            until App.Next() = 0;
                        end;
                    end;
                    Message(TestText);
                end;
            }
        }
    }

    var
        TestText: Text;
}