tableextension 65400 "TST Customer" extends "Customer"
{
    fields
    {
        // Add changes to table fields here
        field(65400; "TST Bonuses"; Integer)
        {
            Caption = 'Bonuses';
            FieldClass = FlowField;
            CalcFormula = count("TST Bonus Header" where("Customer no." = field("No.")));
            Editable = false;

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
        Err: Label 'At least 1 bonus exists for cust. %1', Comment = '%1 - customer';

    trigger OnBeforeDelete()
    begin
        TestIfBonusExists();
    end;

    local procedure TestIfBonusExists()
    var
        BonusHeader: Record "TST Bonus Header";
    begin
        BonusHeader.SetRange("Customer no.", Rec."No.");
        if not BonusHeader.IsEmpty then
            Error(Err, Rec.Name);

    end;
}