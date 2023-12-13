page 65413 "TST Send Mail"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    //SourceTable = TableName;

    layout
    {
        area(Content)
        {
            field("To: "; Receiver)
            {
                ApplicationArea = All;
                ShowMandatory = true;
            }
            field("Subject: "; Subject)
            {
                ApplicationArea = All;
                ShowMandatory = true;
            }
            field("Body: "; Body)
            {
                ApplicationArea = All;
                MultiLine = true;

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Send Mail")
            {
                ApplicationArea = All;
                Image = PostMail;

                trigger OnAction();
                begin
                    Message('To: %1 \ Subject: %2 \ Body: %3', Receiver, Subject, Body);
                end;
            }
        }
    }

    var
        Receiver: Text;
        Subject: Text;
        Body: Text;
}