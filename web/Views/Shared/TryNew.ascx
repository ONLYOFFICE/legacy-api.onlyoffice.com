<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl"
%>

<div class="try-new-block">
    <a id="tryNew" href="<%= HttpUtility.HtmlEncode(ConfigurationManager.AppSettings["trynew"]) %>" class="button active" style="padding: 10px 20px;">TRY NEW VERSION</a>
</div>
