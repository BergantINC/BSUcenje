tableextension 65401 "TST Item Ext" extends Item
{
    fields
    {
        // Add changes to table fields here
        field(66401; "TST Used"; Boolean)
        {
            Caption = 'Used';
            FieldClass = Normal;
            Editable = true;
            DataClassification = CustomerContent;

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
}