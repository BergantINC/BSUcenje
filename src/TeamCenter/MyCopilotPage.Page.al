page 65412 "TST My Copilot Page"
{
    //v resnici ni copilot ker nimam runtime 12.1 ampak 12.0
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