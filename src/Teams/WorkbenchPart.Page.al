page 65414 "TST Workbench"
{
    PageType = CardPart;
    layout
    {
        area(Content)
        {
            field(Code; CodeTxt)
            {
                Caption = 'Code';
                ShowCaption = false;
                ApplicationArea = all;
                MultiLine = true;
                Editable = true;
                StyleExpr = SetStyleExpr;
                Style = Favorable;
                trigger OnValidate()
                begin
                    GlobalErrorTxt := '';
                    CurrPage.JS.Execute(CodeTxt);
                end;
            }
            field(Error; GlobalErrorTxt)
            {
                Caption = 'Message Area';
                ShowCaption = false;
                ApplicationArea = all;
                Editable = false;
                MultiLine = false;
                Style = Unfavorable;
                StyleExpr = true;
            }
            usercontrol(JS; Workbench)
            {
                ApplicationArea = all;
                trigger Error(ErrorTxt: Text)
                begin
                    GlobalErrorTxt := ErrorTxt;
                    SetStyleExpr := false;
                end;

                trigger Executed()
                begin
                    SetStyleExpr := true;
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        SetStyleExpr := true;
    end;

    var
        CodeTxt: Text;
        GlobalErrorTxt: Text;
        SetStyleExpr: Boolean;
}