page 65418 "TST NL Printers"
{
    Caption = 'Printers';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "TST NL Printer";
    SourceTable = "TST NiceLabel Printer";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Printer Name";
                Rec."Printer Name")
                {
                    ApplicationArea = All;
                }
                field("Installed";
                Rec.Installed)
                {
                    ApplicationArea = All;
                }
                field("Printer Type"; Rec."Printer Type")
                {
                    ApplicationArea = All;
                }
                field(Address;
                Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Printer Model";
                Rec."Printer Model")
                {
                    ApplicationArea = All;
                }
                field("Printer Family";
                Rec."Printer Family")
                {
                    ApplicationArea = All;
                }
                field("Group";
                Rec.Group)
                {
                    ApplicationArea = All;
                }
                field("Description";
                Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Priority Driver";
                Rec."Priority Driver")
                {
                    ApplicationArea = All;
                }
                field("Licensed";
                Rec.Licensed)
                {
                    ApplicationArea = All;
                }
                field("Reserved";
                Rec.Reserved)
                {
                    ApplicationArea = All;
                }
                field("Central Settings";
                Rec."Central Settings")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    { }
}