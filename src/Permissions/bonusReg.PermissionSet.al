permissionset 65400 "TST Bonus Reg"
{
    Assignable = true;
    Caption = 'Bonus registration';
    IncludedPermissionSets =;
    Permissions =
        tabledata "TST Bonus Header" = RIMD,
        tabledata "TST Bonus Line" = RIMD,
        tabledata "TST Bonus Entry" = RIMD,
        tabledata "TST Team Table" = RIMD,
        tabledata "TST Report Selection Table" = RIMD;
}
