tableextension 65402 "TST Task Complete" extends "To-do"
{
    fields
    {
        field(65400; "Completed by 2"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Completed by';
            TableRelation = "TST Team Table".Name;
            Editable = true;
        }
        field(65401; "Team Code 2"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Team code';
            TableRelation = "TST Team Table".Name;
            Editable = true;
        }
    }

}