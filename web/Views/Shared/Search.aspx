<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<List<SearchResult>>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Search - <%= HttpUtility.HtmlEncode(Request["query"]) %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% var result = Model ?? new List<SearchResult>(); %>
    <% if (result.Any())
       { %>
    <div class="search-box-result">
        <ul>
            <% foreach (var res in result)
               { %>
            <li>
                <h3><a href="<%= res.Url %>"><%= res.Name %></a></h3>
                <p><%= HttpUtility.HtmlEncode(res.Description) %></p>
            </li>
            <% } %>
        </ul>
    </div>
    <% }
        else
       { %>
    <div class="not-found">
        <h1>
            <span class="search-box-result">没有找到匹配的内容</span>
        </h1>
        <img alt="Not found" src="<%= Url.Content("~/content/img/not-found.svg") %>" />
        <% if (Html.IfController("Home"))
           { %>
        <p><a href="<%= Url.Action("index", "home") %>">转至主页</a></p>
        <% } %>
    </div>
    <% } %>
</asp:Content>
