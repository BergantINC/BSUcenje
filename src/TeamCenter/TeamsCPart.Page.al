page 65411 "TST Teams Card Part"
{
    Caption = 'Teams Card Part';
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "TST Team Table";

    layout
    {
        area(Content)
        {
            cuegroup("Team Info")
            {
                field("Number of Teams"; Rec."Number of Teams")
                {
                    ApplicationArea = All;
                    ToolTip = 'The number of teams';
                }
            }
            cuegroup("Most efficient team")
            {
                actions
                {
                    action("Team reveal")
                    {
                        ApplicationArea = All;
                        Image = TilePeople;
                        trigger OnAction()
                        var
                            Teams: record "TST Team Table";
                            TeamFunct: Codeunit "TST Team Functionality";
                            Msg: Label 'The most efficient team is the team with me in it and that is Team %1!';
                        begin
                            if Teams.FindSet() then
                                repeat
                                    Teams.FindFirst();
                                    if TeamFunct.FindMe(Teams) then begin
                                        Message(Msg, Teams.Name);
                                        exit;
                                    end;
                                until Teams.Next() = 0;
                        end;
                    }
                }
            }
            cuegroup("Bussiest team")
            {
                actions
                {
                    action("Show Team")
                    {
                        ApplicationArea = All;
                        Image = TileInfo;
                        trigger OnAction()
                        var
                            Teams: record "TST Team Table";
                            Msg: Label 'The bussiest team is %1!';
                            maxTeam: Record "TST Team Table";
                            teamFunc: codeunit "TST Team Functionality";
                            currInt: integer;
                            maxInt: integer;
                        begin
                            maxInt := 0;
                            if Teams.findSet() then
                                repeat
                                    currInt := teamFunc.BussiestTeam(Teams);
                                    if maxInt < currInt then begin
                                        maxInt := currInt;
                                        maxTeam := Teams;
                                    end;
                                until Teams.Next() = 0;
                            if not Confirm(Msg, false, maxTeam) then
                                exit;
                        end;
                    }
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