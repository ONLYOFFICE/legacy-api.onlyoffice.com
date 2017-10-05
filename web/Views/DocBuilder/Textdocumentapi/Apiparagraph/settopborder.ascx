<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTopBorder</span>
</h1>

<h4 class="header-gray" id="SetTopBorder">SetTopBorder(sType, nSize, nSpace, r, g, b)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apiparapr/settopborder") %>">ApiParaPr.SetTopBorder</a>
                </li></ul></dd>
                </dl>
               
<p class="dscr"> Specify the border which will be displayed above a set of paragraphs which have the same set of paragraph border settings.</p>                   
<div class="note">The paragraphs of the same style going one by one are considered as a single block, so the border is added to the whole block rather than to every paragraph in this block.</div>

<h2>Parameters:</h2>
<table class="table">
    <thead>
    <tr class="tablerow">
        <td>Name</td>
        <td>Type</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
                <td><em>sType</em></td>
            <td>
             <a href="<%= Url.Action("global") %>#BorderType">BorderType</a>
            </td>
            <td>The border style.</td>
        </tr>
        <tr class="tablerow">
                <td><em>nSize</em></td>
            <td>
            <a href="<%= Url.Action("global") %>#pt_8">pt_8</a>
            </td>
            <td>The width of the current top border measured in eighths of a point.</td>
        </tr>
        <tr class="tablerow">
                <td><em>nSpace</em></td>
            <td>
            <a href="<%= Url.Action("global") %>#pt">pt</a>
            </td>
            <td>The spacing offset above the paragraph measured in points used to place this border.</td>
        </tr>
        <tr class="tablerow">
                <td><em>r</em></td>
            <td>
             <a href="<%= Url.Action("global") %>#byte">byte</a>
            </td>
            <td>Red color component value.</td>
        </tr>
        <tr class="tablerow">
                <td><em>g</em></td>
            <td>
             <a href="<%= Url.Action("global") %>#byte">byte</a>
            </td>
            <td>Green color component value.</td>
        </tr>
        <tr class="tablerow">
                <td><em>b</em></td>
            <td>
            <a href="<%= Url.Action("global") %>#byte">byte</a>
            </td>
            <td>Blue color component value.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is the first paragraph. We will add a thick green border above it.");
oParagraph.SetTopBorder("single", 24, 0, 0, 255, 0);
builder.SaveFile("docx", "SetTopBorder.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891156&doc=U21JRjRJbENhcS92dHZjWWpNSEppR1lTZTVBL0hJbFM2a2RMdllreWZZOD0_IjQ4OTExNTYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
