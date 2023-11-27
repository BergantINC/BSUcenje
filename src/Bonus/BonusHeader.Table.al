table 65400 "TST Bonus Header"
{
    DataClassification = CustomerContent;
    Caption = 'Bonus';
    DrillDownPageId = "TST Bonus List";
    LookupPageId = "TST Bonus List";


    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            trigger OnValidate()
            begin
                TestStatus();
            end;
        }
        field(2; "Customer no."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            TableRelation = Customer;
            trigger OnValidate()
            begin
                TestStatus();
            end;
        }
        field(3; "Starting date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Starting date';
            trigger OnValidate()
            var
            begin
                if "Starting date" > "Ending date" then
                    "Ending date" := "Starting date";
                TestStatus();
            end;

        }
        field(4; "Ending date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Ending date';
            trigger OnValidate()
            var
            begin
                if "Ending date" < "Starting date" then
                    "Starting date" := "Ending date";
                TestStatus();
            end;

        }
        field(5; "Status"; Enum "TST Bonus Header Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        ErrMsg: Label 'Status is %1', Comment = '%1 is Status';

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin
        TestStatus();
        DeleteLines();
    end;

    trigger OnRename()
    begin

    end;

    local procedure TestStatus()
    var

    begin
        if Status = Status::Released then
            Error(ErrMsg, Rec.Status);
    end;

    local procedure DeleteLines()
    var
        BonusLine: record "TST Bonus Line";
    begin
        BonusLine.SetRange("Document No.", "No.");
        BonusLine.DeleteAll(true);
    end;
}