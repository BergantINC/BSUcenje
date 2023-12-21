controladdin Workbench
{
    MaximumHeight = 10000;
    MaximumWidth = 10000;
    MinimumHeight = 100;
    MinimumWidth = 60;
    HorizontalShrink = true;
    HorizontalStretch = true;
    RequestedHeight = 150;
    RequestedWidth = 78;
    Scripts = 'src/Codeunits/workbench.js';
    StartupScript = 'src/Codeunits/startup.js';

    event ControlReady();
    procedure Execute(Code: Text);
    event Error(ErrorTxt: Text);
}