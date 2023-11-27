table 65403 "TST Report Selection Table"
{
    DataClassification = CustomerContent;
    Caption = 'Report Selection Table';

    fields
    {
        field(1; "Sequence"; Integer)
        {
            Caption = 'Sequence';
            DataClassification = CustomerContent;
        }
        field(2; "Report ID"; Integer)
        {
            Caption = 'Report ID';
            DataClassification = CustomerContent;
        }
        field(3; "Report Caption"; Text[255])
        {
            Caption = 'Report Caption';
            DataClassification = CustomerContent;
        }
        field(4; "Usage"; Option)
        {
            Caption = '/';
            DataClassification = CustomerContent;
            OptionMembers = Work,Home,Other;
            OptionCaption = 'Work,Home,Other';
        }
        field(5; "Usage fix"; Enum "TST Report Selection Type")
        {
            Caption = 'Usage';
            DataClassification = CustomerContent;
        }
        field(6; "Creation time"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'Creation time';
            Editable = false;
        }
        field(7; "Last modified"; DateTime)
        {
            Caption = 'Last modified';
            Editable = false;
            DataClassification = CustomerContent;

        }
        field(8; "Employee No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Employee No.';
            TableRelation = Employee."No.";
        }

    }

    keys
    {
        key(PK; "Report ID")
        {
            Clustered = true;
        }
    }

}