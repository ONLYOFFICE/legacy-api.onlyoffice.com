﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Config</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The config base section allows to change the platform type used, document display size (width and height) and type of the document opened.</p>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="documentType" class="copy-link">documentType</td>
            <td>Defines the document type to be opened:
                <em>open a text document (.doc, .docm, .docx, .dot, .dotm, .dotx, .epub, .fodt, .htm, .html, .mht, .odt, .ott, .pdf, .rtf, .txt, .djvu, .xps) for viewing or editing</em> - <b>text</b>,
                <em>open a spreadsheet (.csv, .fods, .ods, .ots, .xls, .xlsm, .xlsx, .xlt, .xltm, .xltx) for viewing or editing</em> - <b>spreadsheet</b>,
                <em>open a presentation (.fodp, .odp, .otp, .pot, .potm, .potx, .pps, .ppsm, .ppsx, .ppt, .pptm, .pptx) for viewing  or editing</em> - <b>presentation</b>.
            </td>
            <td>string</td>
            <td>"spreadsheet"</td>
        </tr>
        <tr class="tablerow">
            <td id="height" class="copy-link">height</td>
            <td>Defines the document height (<b>100%</b> by default) in the browser window.</td>
            <td>string</td>
            <td>"100%"</td>
        </tr>
        <tr class="tablerow">
            <td id="token" class="copy-link">token</td>
            <td>Defines the encrypted signature added to the <b>Document Server</b> config in the form of a <a href="<%= Url.Action("signature/browser") %>#config">token</a>.</td>
            <td>string</td>
            <td>"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.t-IDcSemACt8x4iTMCda8Yhe3iZaWbvV5XKSTbuAn0M"</td>
        </tr>
        <tr class="tablerow">
            <td id="type" class="copy-link">type</td>
            <td>
                Defines the platform type used to access the document.
                Can be:
                <em>optimized to access the document from a desktop or laptop computer</em> - <b>desktop</b>,
                <em>optimized to access the document from a tablet or a smartphone</em> - <b>mobile</b>,
                <em>specifically formed to be easily embedded into a web page</em> - <b>embedded</b>.
                The default value is <b>"desktop"</b>.
            </td>
            <td>string</td>
            <td>"desktop"</td>
        </tr>
        <tr class="tablerow">
            <td id="width" class="copy-link">width</td>
            <td>Defines the document width (<b>100%</b> by default) in the browser window.</td>
            <td>string</td>
            <td>"100%"</td>
        </tr>
    </tbody>
</table>

<div class="header-gray">Example</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "documentType": "text",
    "height": "100%",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.t-IDcSemACt8x4iTMCda8Yhe3iZaWbvV5XKSTbuAn0M",
    "type": "desktop",
    "width": "100%",
    ...
});
</pre>
