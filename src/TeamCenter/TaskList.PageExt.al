pageextension 65408 "TST Task List" extends "Task List"
{
    layout
    {
        addfirst(Control1)
        {
            field("Team Code 2"; Rec."Team Code 2")
            {
                ApplicationArea = All;
                ToolTip = 'Real teams only';
            }
        }
    }
}