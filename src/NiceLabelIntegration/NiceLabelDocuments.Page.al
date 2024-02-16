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
                Caption = 'Test Action';
                Image = TestReport;

                trigger OnAction()
                var
                    SomeValue: Integer;
                begin
                    TestParameters(SomeValue);
                end;
            }
        }
    }

    local procedure TestParameters(var SomeValue: Integer)
    var
    begin
        SomeValue := 10;
        Message('The value of VAR is %1', SomeValue);
    end;
}