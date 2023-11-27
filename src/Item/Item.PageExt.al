pageextension 65401 "TST Item List" extends "Item List"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("TST is Used"; Rec."TST Used")
            {
                ApplicationArea = All;
                Tooltip = 'Is the item used or not';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
}