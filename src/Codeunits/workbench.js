function Execute(code)
{
    try
    {
      eval(code);
    }
    catch(e)
    {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Error',[e.toString()]);
    }
}
function showall(data)
{
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Error',[JSON.stringify(data,getCircularReplacer())]);

}
function show(data)
{
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Error',[data.toString()]);

}
const getCircularReplacer = () => {
  const seen = new WeakSet();
  return (key, value) => {
    if (typeof value === "object" && value !== null) {
      if (seen.has(value)) {
        return;
      }
      seen.add(value);
    }
    return value;
  };
};
//Vse slikice se rotirajo
/*var elements = window.parent.document.getElementsByClassName("ms-Icon root-89 css-116 ms-Button-icon action-icon--2VaomB3-wjIWvoD3qkl3Qz thm-icon-color--brand-primary_minflat_45 thm-icon-color--brand-primary_mintint_45--hover thm-icon-color--brand-primary_mintint_45--focus thm-icon-color--style-standard_medflat_45--active thm-color--style-standard_medflat_45--states_is-expanded--not_FCM thm-color--style-subordinate_minflat_45--states_is-disabled--not_FCM thm-color--style-subordinate_minflat_45--hover--states_is-disabled--not_FCM thm-color--style-subordinate_minflat_45--active--states_is-disabled--not_FCM thm-bgcolor--palette--1726194350 thm-bgcolor--palette--1726194350--hover--states_is-disabled thm-bgcolor--palette--1726194350--active--states_is-disabled thm-bgcolor--mintint--hover thm-bgcolor--mintint--focus thm-bgcolor--medflat--active thm-bgcolor--medflat--states_is-expanded thm-bgcolor--palette--1726194350--states_is-checked thm-bdrcolor--style-subordinate_minflat_45--states_is-disabled__is-checked thm-bdrcolor--brand-primary_minflat_45--states_is-checked icon-106 action-icon--2VaomB3-wjIWvoD3qkl3Qz thm-icon-color--brand-primary_minflat_45 thm-icon-color--brand-primary_mintint_45--hover thm-icon-color--brand-primary_mintint_45--focus thm-icon-color--style-standard_medflat_45--active thm-color--style-standard_medflat_45--states_is-expanded--not_FCM thm-color--style-subordinate_minflat_45--states_is-disabled--not_FCM thm-color--style-subordinate_minflat_45--hover--states_is-disabled--not_FCM thm-color--style-subordinate_minflat_45--active--states_is-disabled--not_FCM thm-bgcolor--palette--1726194350 thm-bgcolor--palette--1726194350--hover--states_is-disabled thm-bgcolor--palette--1726194350--active--states_is-disabled thm-bgcolor--mintint--hover thm-bgcolor--mintint--focus thm-bgcolor--medflat--active thm-bgcolor--medflat--states_is-expanded thm-bgcolor--palette--1726194350--states_is-checked thm-bdrcolor--style-subordinate_minflat_45--states_is-disabled__is-checked thm-bdrcolor--brand-primary_minflat_45--states_is-checked");
elements = window.parent.document.querySelectorAll(".ms-Icon");
var deg = 0;
//console.log(elements[0]);
function rotate(){
 for (var i = 0; i < elements.length; i++){
 elements[i].setAttribute("style","transform: rotate("+ deg.toString() +"deg)");
//console.log(elements[i]);
}
 deg++;
}
window.setInterval(rotate,10);*/