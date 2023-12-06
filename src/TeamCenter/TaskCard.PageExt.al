pageextension 65406 "TST Task Card" extends "Task Card"
{
    layout
    {
        addlast(General)
        {
            field("Completed by 2"; Rec."Completed by 2")
            {
                ApplicationArea = All;
            }
            field("Team Code 2"; Rec."Team Code 2")
            {
                ApplicationArea = All;
            }
        }
    }
}