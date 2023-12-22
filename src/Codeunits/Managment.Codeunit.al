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

    procedure Rec2Json(Rec: Variant): JsonObject
    var
        Ref: RecordRef;
        Output: JsonObject;
        FieldRef: FieldRef;
        i: Integer;
    begin
        if not Rec.IsRecord then
            Error('Parameter is not a record, fool of a Tuk!');
        Ref.GetTable(Rec);
        for i := 1 to Ref.FieldCount() do begin
            FieldRef := Ref.FieldIndex(i);
            if not (FieldRef.Name = 'Number of Teams') then
                Output.Add(FieldRef.Name, FieldRef2JsonValue(FieldRef));
        end;
        exit(Output);
    end;

    local procedure FieldRef2JsonValue(FieldRef: FieldRef): JsonValue
    var
        json: JsonValue;
        Datic: Date;
        Tekstic: Text;
        Codic: Code[20];
    begin
        case FieldRef.Type() of
            FieldType::Date:
                begin
                    Datic := FieldRef.Value;
                    json.SetValue(Datic);
                end;
            Fieldtype::Text:
                begin
                    Tekstic := FieldRef.Value;
                    json.SetValue(Tekstic);
                end;
            Fieldtype::Code:
                begin
                    Codic := FieldRef.Value;
                    json.SetValue(Codic);
                end;
        end;
        exit(json);
    end;

    procedure SetImage(Employee: Record Employee)
    var
        InS: InStream;
        Filename: Text;
    begin
        if UploadIntoStream('', '', '', FileName, InS) then begin
            Employee.Image.ImportStream(Ins, Filename);
            Employee.Modify(true);
        end else
            Error('Something went wrong with the upload, please refresh the site and try again.');
    end;

    procedure SetImage(Team: Record "TST Team Table")
    var
        InS: InStream;
        Filename: Text;
    begin
        if UploadIntoStream('', '', '', FileName, InS) then begin
            Team."Team Spirit".ImportStream(Ins, Filename);
            Message('Team name: %1 %2', Team.Name, Filename);
            Team.Modify(true);
        end else
            Error('Something went wrong with the upload, please refresh the site and try again.');
    end;
}