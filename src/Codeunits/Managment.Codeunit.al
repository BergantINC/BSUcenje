codeunit 65404 "TST Managment" implements EmployeeInterface
{
    procedure GetName(Employee: Record Employee): Text
    begin
        exit(Employee."First Name");
    end;

    procedure GetSurname(Employee: Record Employee): Text
    begin
        exit(Employee."Last Name");
    end;

    procedure GetGender(Employee: Record Employee): Text
    begin
        exit(Format(Employee.Gender));
    end;

    procedure GetMail(Employee: Record Employee): Text
    begin
        if Employee."Company E-Mail" <> '' then
            exit(Employee."Company E-Mail");
        exit(Employee."E-Mail");
    end;

    procedure GetBirthday(Employee: Record Employee): Date
    begin
        exit(Employee."Birth Date");
    end;

    procedure GetTeam(Employee: Record Employee): Text
    begin
        exit(Employee."Team Name");
    end;

    procedure GetAge(Employee: Record Employee): Decimal
    begin
        exit(round((Today() - GetBirthday(Employee)) / 365));
    end;

    procedure ChangeToBlackAndWhitePicture(Item: Record Item)
    var
        TenantMedia: Record "Tenant Media";
        Client: HttpClient;
        Content: HttpContent;
        ResponseMessage: HttpResponseMessage;
        Stream: InStream;
        Url: Text;
    begin
        if not (Item.Picture.Count() > 0) then
            exit;

        if not TenantMedia.Get(Item.Picture.Item(1)) then
            exit;

        TenantMedia.CalcFields(Content);

        if not TenantMedia.Content.HasValue() then
            exit;

        TenantMedia.Content.CreateInStream(Stream);
        Content.WriteFrom(Stream);
        Url := 'https://mywebsite.com/ImageConverter';
        if not client.Post(Url, Content, ResponseMessage) then
            exit;

        if not ResponseMessage.IsSuccessStatusCode() then
            exit;

        ResponseMessage.Content().ReadAs(Stream);
        Clear(Item.Picture);
        Item.Picture.ImportStream(Stream, 'New Image');
        Item.Modify(true);
    end;
}