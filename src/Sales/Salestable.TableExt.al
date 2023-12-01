tableextension 65403 "TST Sales Table" extends "Sales Line"
{
    fields
    {
        // Add changes to table fields here
        field(66401; "TST Used"; Boolean)
        {
            Caption = 'Used';
            FieldClass = Normal;
            editable = false;
            TableRelation = Item."TST Used";
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