page 65415 "TST Terminal"
{
    PageType = Card;
    Caption = 'Javascript Terminal';
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            part(Workbench; "TST Workbench")
            {
                ApplicationArea = All;
                Caption = 'Terminal';
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}