page 65417 "TST NiceLabel Documents"
{
    Caption = 'NiceLabel Documents';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = User;

    layout
    {
        area(Content)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    TestParameters(5);
                end;
            }
        }
    }

    local procedure TestParameters(SomeValue: Integer)
    var
    begin
        SomeValue := 10;
        Message('The value of VAR is %1', SomeValue);
    end;
}