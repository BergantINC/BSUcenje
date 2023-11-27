pageextension 65402 "TST Item Card" extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(Item)
        {
            field("TST Used"; Rec."TST Used")
            {
                ApplicationArea = All;
                ToolTip = 'For how long has the item been used';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
}