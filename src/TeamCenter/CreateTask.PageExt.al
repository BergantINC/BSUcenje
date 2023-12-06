pageextension 65407 "TST Create Task" extends "Create Task"
{
    layout
    {
        addlast(General)
        {
            field("Team Code 2"; Rec."Team Code 2")
            {
                ApplicationArea = All;
                Caption = 'Team';
            }
        }
    }
}