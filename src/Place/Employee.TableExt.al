tableextension 65404 "TST Employee" extends Employee
{
    fields
    {
        // Add changes to table fields here
        field(65404; "TST Work years"; Integer)
        {
            Caption = 'Work years';
            Editable = true;
            FieldClass = normal;
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                myInt := Round((1000 + 1000 * (Rec."TST Work years" * 0.05)), 1, '=');
                Rec."TST Salary" := myInt;
            end;

        }
        field(65405; "TST Salary"; Integer)
        {
            Caption = 'Salary';
            Editable = false;
            FieldClass = Normal;

        }
        field(65400; "Team Name"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Team Name';
            TableRelation = "TST Team Table".Name;
            InitValue = 'DEFAULT';
        }
        field(65401; "Team Lead"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Team Lead';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
}