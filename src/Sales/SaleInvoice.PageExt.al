pageextension 65404 "TST Sales Invoice Subform" extends "Sales Invoice Subform"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("TST Used"; Rec."TST Used")
            {
                ApplicationArea = All;
                Tooltip = 'Is the item used or not';
                Caption = 'Used';

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
}