table 65405 "TST NiceLabel Printer"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Printer Name"; Code[50])
        {
            Caption = 'Printer Name';
        }
        field(2; "Installed"; Boolean)
        {
            Caption = 'Installed';
        }
        field(3; "Printer Type"; Enum "TST Printer Type")
        {
            Caption = 'Printer Type';
        }
        field(4; Address; Text[256])
        {
            Caption = 'Address';
        }
        field(5; "Printer Model"; Text[256])
        {
            Caption = 'Printer Model';
        }
        field(6; "Printer Family"; Text[256])
        {
            Caption = 'Printer Family';
        }
        field(7; "Group"; Text[256])
        {
            Caption = 'Group';
        }
        field(8; "Description"; Text[256])
        {
            Caption = 'Description';
        }
        field(9; "Priority Driver"; Code[20])
        {
            Caption = 'Priority Driver';
        }
        field(10; "Licensed"; Code[20])
        {
            Caption = 'Licensed';
        }
        field(11; "Reserved"; Boolean)
        {
            Caption = 'Reserved';
        }
        field(12; "Central Settings"; Code[20])
        {
            Caption = 'Central Settings';
        }
    }

    keys
    {
        key(PK; "Printer Name")
        {
            Clustered = true;
        }
    }

}