page 65416 "TST Team Spirit"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = None;
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    SourceTable = "TST Team Table";
    Caption = 'Team Spirit';

    layout
    {
        area(Content)
        {
            group(Spirit)
            {
                ShowCaption = false;
                field(Name; Rec.Name)
                {
                    Visible = false;
                }
                field("Team Spirit"; Rec."Team Spirit")
                {
                    ShowCaption = false;
                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
        }
    }
}