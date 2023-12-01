table 65404 "TST Team Table"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "TST Team List";
    LookupPageId = "TST Team List";

    fields
    {
        field(1; "Name"; Code[20])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(2; "Task"; Code[20])
        {
            Caption = 'Task';
            DataClassification = CustomerContent;
            TableRelation = "To-do"."No.";
        }

    }

    keys
    {
        key(PK; "Name")
        {
            Clustered = true;
        }
    }

}