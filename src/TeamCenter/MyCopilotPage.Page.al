page 65412 "TST My Copilot Page"
{
    Caption = 'Standard Dialog Test';
    Sourcetable = "TST Team Table";

    PageType = StandardDialog;

    layout
    {
        area(Content)
        {
            repeater("TST Team table")
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}