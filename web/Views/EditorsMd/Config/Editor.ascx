﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/") %>"></a>
    <span class="hdr">Editor config</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The editorConfig section allows to change the parameters pertaining to the editor interface: opening mode (viewer or editor), interface language, additional buttons, etc.).</p>

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
            <td id="actionLink" class="copy-link">actionLink</td>
            <td>Specifies the data received from the <b>document editing service</b> using the <a href="<%= Url.Action("config/events") %>#onMakeActionLink">onMakeActionLink</a> event or the <a href="<%= Url.Action("config/events") %>#onRequestSendNotify">onRequestSendNotify</a> event in <em>data.actionLink</em> parameter, which contains the information about the action in the document that will be scrolled to.</td>
            <td>object</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="callbackUrl" class="copy-link">callbackUrl<span class="required">*</span></td>
            <td>Specifies absolute URL to the <b>document storage service</b> (which <a href="<%= Url.Action("callback") %>">must be implemented</a> by the software integrators who use ONLYOFFICE Document Server on their own server).</td>
            <td>string</td>
            <td>"https://example.com/url-to-callback.ashx"</td>
        </tr>
        <tr>
            <td id="createUrl" class="copy-link">createUrl</td>
            <td>
                Defines the absolute URL of the document where it will be created and available after creation.
                If not specified, there will be no creation button.
            </td>
            <td>string</td>
            <td>"https://example.com/url-to-create-document/"</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/create.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="lang" class="copy-link">lang</td>
            <td>
                Defines the editor interface language (if some other languages other than English are present).
                Is set using the two letter (<b>de</b>, <b>ru</b>, <b>it</b>, etc.) language codes.
                The default value is <b>"en"</b>.
            </td>
            <td>string</td>
            <td>"en"</td>
        </tr>
        <tr class="tablerow">
            <td id="mode" class="copy-link">mode</td>
            <td>
                Defines the editor opening mode.
                Can be either <b>view</b> to open the document for viewing, or <b>edit</b> to open the document in the editing mode allowing to apply changes to the document data.
                The default value is <b>"edit"</b>.
            </td>
            <td>string</td>
            <td>"edit"</td>
        </tr>
        <tr>
            <td id="recent" class="copy-link">recent</td>
            <td>Defines the presence or absence of the documents in the <b>Open Recent...</b> menu option where the following document parameters can be set:
                <ul>
                    <li>
                        <b>folder</b> - the folder where the document is stored (can be empty in case the document is stored in the root folder),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "Example Files";
                    </li>
                    <li>
                        <b>title</b> - the document title that will be displayed in the <b>Open Recent...</b> menu option,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "exampledocument1.docx";
                    </li>
                    <li>
                        <b>url</b> - the absolute URL to the document where it is stored,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com/exampledocument1.docx".
                    </li>
                </ul>
            </td>
            <td>array of object</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/recent.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="region" class="copy-link">region</td>
            <td>
                Defines the default display format for currency and date and time (in the <b>Spreadsheet Editor</b> only).
                Is set using the four letter (<b>en-US</b>, <b>fr-FR</b>, etc.) language codes.
                For the default value the <em>lang</em> parameter is taken, or, if no regional setting corresponding to the <em>lang</em> value is available, <b>en-US</b> is used.
            </td>
            <td>string</td>
            <td>"en-US"</td>
        </tr>
        <tr class="tablerow">
            <td id="user" class="copy-link">user</td>
            <td>Defines the user currently viewing or editing the document:
                <ul>
                    <li>
                        <b>firstname</b> - the first name of the user.
                        Deprecated since version 4.2, please use <em>name</em> instead,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "John";
                    </li>
                    <li>
                        <b>id</b> - the identification of the user,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "78e1e841";
                    </li>
                    <li>
                        <b>lastname</b> - the last name of the user.
                        Deprecated since version 4.2, please use <em>name</em> instead,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "Smith";
                    </li>
                    <li>
                        <b>name</b> - the full name of the user.
                        Used since version 4.2,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "John Smith".
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
    </tbody>
</table>

<span class="required-descr"><span class="required">*</span><em> - required field</em></span>
<div class="header-gray">Example</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "actionLink": ACTION_DATA,
        "callbackUrl": "https://example.com/url-to-callback.ashx",
        "createUrl": "https://example.com/url-to-create-document/",
        "lang": "en",
        "mode": "edit",
        "recent": [
            {
                "folder": "Example Files",
                "title": "exampledocument1.docx",
                "url": "https://example.com/exampledocument1.docx"
            },
            {
                "folder": "Example Files",
                "title": "exampledocument2.docx",
                "url": "https://example.com/exampledocument2.docx"
            },
            ...
        ],
        "region": "en-US",
        "user": {
            "id": "78e1e841",
            "name": "John Smith"
        }
    },
    ...
});
</pre>
<p>
    Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
    See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
</p>
