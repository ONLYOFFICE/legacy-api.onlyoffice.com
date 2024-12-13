﻿<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Methods
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Methods</span>
    </h1>

    <p class="dscr">After initializing <b>document editor</b> you will get the object that can be used to call the methods.</p>
    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", config);
</pre>

    <ul>
        <li><a href="#createConnector">createConnector</a> - create the connector to interact with text documents, spreadsheets, presentations, and fillable forms from the outside.</li>
        <li><a href="#denyEditingRights">denyEditingRights</a> - deny editing.</li>
        <li><a href="#destroyEditor">destroyEditor</a> - destroy <em>docEditor</em> object.</li>
        <li><a href="#downloadAs">downloadAs</a> - download the edited file.</li>
        <li><a href="#insertImage">insertImage</a> - insert an image into the file.</li>
        <li><a href="#refreshHistory">refreshHistory</a> - show the document version history.</li>
        <li><a href="#requestClose">requestClose</a> - request to close the editor.</li>
        <li><a href="#setActionLink">setActionLink</a> - set the link to the document which contains a bookmark.</li>
        <li><a href="#setFavorite">setFavorite</a> - change the <em>Favorite</em> icon state.</li>
        <li><a href="#setHistoryData">setHistoryData</a> - send the link to the document for viewing the version history.</li>
        <li><a href="#setMailMergeRecipients">setMailMergeRecipients</a> - insert recipient data for mail merge into the file.</li>
        <li><a href="#setReferenceData">setReferenceData</a> - refresh data by a link to a file.</li>
        <li><a href="#setReferenceSource">setReferenceSource</a> - change a source of the external data.</li>
        <li><a href="#setRequestedDocument">setRequestedDocument</a> - select a document for comparing or combining.</li>
        <li><a href="#setRequestedSpreadsheet">setRequestedSpreadsheet</a> - insert recipient data for mail merge into the file.</li>
        <li><a href="#setRevisedFile">setRevisedFile</a> - select a document for comparing.</li>
        <li><a href="#setSharingSettings">setSharingSettings</a> - update the <em>information</em> about the settings which allow to share the document with other users.</li>
        <li><a href="#setUsers">setUsers</a> - set a list of users to mention in the comments, grant the access rights to edit the specific sheet ranges, or set the user avatars.</li>
        <li><a href="#showMessage">showMessage</a> - display tooltip with the message.</li>
        <li><a href="#startFilling">startFilling</a> - start filling out the ready forms and lock the pdf editing.</li>
    </ul>

    <h2>Methods and their description:</h2>
    <ul>
        <li>
            <p>
                <b id="createConnector" class="copy-link">createConnector</b><a href="#requiredDescr" class="required">*</a> - create the <a href="<%= Url.Action("connector") %>">connector</a> to interact with text documents, spreadsheets, presentations, and fillable forms from the outside.
            </p>
            <pre>
docEditor.createConnector();
</pre>
        </li>
        <li>
            <p>
                <b id="denyEditingRights" class="copy-link">denyEditingRights</b> - deny editing.
                This method can be called when you want to make the document editing unavailable.
            </p>
            <pre>
docEditor.denyEditingRights(message);
</pre>
            
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>message</td>
                        <td>Defines the text messages for dialog.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p>
                <b id="destroyEditor" class="copy-link">destroyEditor</b> - destroy <em>docEditor</em> object.
                This method can be called when you want to reinit document editor with another configurations.
                Used since version 4.3.
            </p>
            <pre>
docEditor.destroyEditor();
</pre>
        </li>

        <li>
            <p>
                <b id="downloadAs" class="copy-link">downloadAs</b> - download the edited file.
                This method can be called only when the existence of the <a href="<%= Url.Action("config/events") %>#onDownloadAs">onDownloadAs</a> events.
                <b>Document editing service</b> asynchronously creates a document and triggers the <b>onDownloadAs</b> event with a link in parameter.
            </p>
            <pre>
docEditor.downloadAs(format);
</pre>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>format</td>
                        <td>
                            Defines the format in which a file will be downloaded.
                            All the possible formats you can find in the <a href="<%= Url.Action("conversionapi") %>#text-matrix">conversion tables</a>.
                            But you cannot download a file in the image formats such as <em>bmp</em>, <em>gif</em>, <em>jpg</em>, <em>png</em>.
                            If this parameter is undefined, the file will be downloaded in the OOXML format according to the file type.
                        </td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <note>
                Please note that conversion from the <em>djvu</em>, <em>pdf</em>, <em>xps</em> formats are not available.
                The original format will be downloaded.
            </note>
        </li>

        <li>
            <p>
                <b id="insertImage" class="copy-link">insertImage</b> - insert an image into the file.
                Starting from version 7.0, this method allows a user to insert several images.
                The <em>images</em> array is used to do it.
                This method must be called after the <a href="<%= Url.Action("config/events") %>#onRequestInsertImage">onRequestInsertImage</a> events.
            </p>
            <pre>
docEditor.insertImage({
    "c": "add",
    "images": [
        {
            "fileType": "png",
            "url": "https://example.com/url-to-example-image1.png"
        },
        {
            "fileType": "png",
            "url": "https://example.com/url-to-example-image2.png"
        },
        ...
    ],
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjIjoiYWRkIiwiaW1hZ2VzIjpbeyJmaWxlVHlwZSI6InBuZyIsInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtaW1hZ2UxLnBuZyJ9LHsiZmlsZVR5cGUiOiJwbmciLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWltYWdlMi5wbmcifV19.JfSa__qPeY3MjUgdkJDjdfJWBgvCmEdLfFzjd3WgeUA"
});
</pre>
            <p>
                Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
                See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
            </p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>c</td>
                        <td>
                            Defines a type of image insertion from the event.
                            Can be: <em>add</em>, <em>change</em>, <em>fill</em>, <em>watermark</em>, <em>slide</em>.
                            The default value is "<em>add</em>".
                        </td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>fileType</td>
                        <td>
                            Defines a type of the image to be inserted into the file.
                            Can be: <em>bmp</em>, <em>gif</em>, <em>jpe</em>, <em>jpeg</em>, <em>jpg</em>, <em>png</em>.
                            Deprecated since version 7.0, please use the <em>images.fileType</em> parameter instead.
                        </td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>images</td>
                        <td>
                            Defines an array of images to be inserted.
                        </td>
                        <td>array of objects</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>images.fileType</td>
                        <td>
                            Defines a type of the image to be inserted into the file.
                            Can be: <em>bmp</em>, <em>gif</em>, <em>jpe</em>, <em>jpeg</em>, <em>jpg</em>, <em>png</em>.
                        </td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>images.url</td>
                        <td>
                            Defines an absolute URL where the source image is stored.
                            Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links.
                        </td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr id="insertImage-token" class="tablerow">
                        <td>token</td>
                        <td>Defines the encrypted signature added to the parameter in the form of a <a href="<%= Url.Action("signature/browser") %>#insertImage">token</a>.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>
                            Defines an absolute URL where the source image is stored.
                            Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links.
                            Otherwise, an error will occur.
                            Deprecated since version 7.0, please use the <em>images.url</em> parameter instead.
                        </td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <note>
                <p>Prior to version 7.0, this method allowed to insert only one image and had the following parameters:</p>
                <pre>
docEditor.insertImage({
    "c": "add",
    "fileType": "png",
    "url": "https://example.com/url-to-example-image.png"
});
</pre>
                <p>
                    Please note that this structure is deprecated and will not be supported by the next editors versions.
                    Please use a new one.
                </p>
            </note>
        </li>

        <li>
            <p>
                <b id="refreshHistory" class="copy-link">refreshHistory</b> - show the document version history.
                This method must be called after the <a href="<%= Url.Action("config/events") %>#onRequestHistory">onRequestHistory</a> events.
            </p>
            <pre>
docEditor.refreshHistory({
    "currentVersion": 2,
    "history": [
        {
            "created": "2010-07-06 10:13 AM",
            "key": "af86C7e71Ca8",
            "user": {
                "id": "F89d8069ba2b",
                "name": "Kate Cage"
            },
            "version": 1
        },
        {
            "created": "2010-07-07 3:46 PM",
            "key": "Khirz6zTPdfd7",
            "user": {
                "id": "78e1e841",
                "name": "John Smith"
            },
            "version": 2
        },
        ...
    ],
});
</pre>
            <p>
                If after editing and saving the document the <em>history</em> with the object changes and server version is returned, send the object changes in the <em>changes</em> parameter and the server version in the <em>serverVersion</em> parameter.
            </p>
            <pre>
docEditor.refreshHistory({
    "currentVersion": 2,
    "history": [
        {
            "created": "2010-07-06 10:13 AM",
            "key": "af86C7e71Ca8",
            "user": {
                "id": "F89d8069ba2b",
                "name": "Kate Cage"
            },
            "version": 1
        },
        {
            "changes": changes,
            "created": "2010-07-07 3:46 PM",
            "key": "Khirz6zTPdfd7",
            "serverVersion": serverVersion,
            "user": {
                "id": "78e1e841",
                "name": "John Smith"
            },
            "version": 2
        },
        ...
    ],
});
</pre>
            <p>Where <b>changes</b> is the <em>changes</em> from <a href="<%= Url.Action("callback") %>#history">the history object</a> returned after saving the document.</p>
            <p>Where <b>serverVersion</b> is the <em>serverVersion</em> from <a href="<%= Url.Action("callback") %>#history">the history object</a> returned after saving the document.</p>
            <p>Show an error message explaining why the version history cannot be displayed:</p>
            <pre>
docEditor.refreshHistory({
    "error": "Exception",
});
</pre>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>currentVersion</td>
                        <td>Defines the current document version number.</td>
                        <td>integer</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>error</td>
                        <td>Defines the error message text.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history</td>
                        <td>Defines the array with the document versions.</td>
                        <td>array</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.changes</td>
                        <td>Defines the <em>changes</em> from <a href="<%= Url.Action("callback") %>#history">the history object</a> returned after saving the document.</td>
                        <td>object</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.created</td>
                        <td>Defines the document version creation date.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.key</td>
                        <td>Defines the unique document identifier used by the service to recognize the document.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.serverVersion</td>
                        <td>
                            Defines the current server version number.
                            If the <em>changes</em> parameter is sent, then the <em>serverVersion</em> parameter is required to be sent as well.
                        </td>
                        <td>integer</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.user</td>
                        <td>Defines the user who is the author of the document version.</td>
                        <td>object</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.user.id</td>
                        <td>Defines the identifier of the user who is the author of the document version.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.user.name</td>
                        <td>Defines the name of the user who is the author of the document version.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.version</td>
                        <td>Defines the document version number.</td>
                        <td>integer</td>
                        <td>required</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="requestClose" class="copy-link">requestClose</b> - request to close the editor.
                It is recommended to call this method before the <a href="#destroyEditor">destroyEditor</a> method to check if there is some unsaved data in the editor or not. 
                If the unsaved data exists, then the dialog box will be displayed to ask the user whether they want to continue editing or close the editor losing all the unsaved data. 
                If the <em>Close</em> option will be chosen, then the <a href="<%= Url.Action("config/events") %>#onRequestClose">onRequestClose</a> event will be called.
            </p>
            <pre>
docEditor.requestClose();
</pre>
        </li>

        <li>
            <p>
                <b id="setActionLink" class="copy-link">setActionLink</b> - set the link to the document which contains a bookmark.
                This method must be called after the <a href="<%= Url.Action("config/events") %>#onMakeActionLink">onMakeActionLink</a> event.
                The software integrator must process the <em>ACTION_DATA</em> received from the <b>document editing service</b> to set the link.
                The link is created by the software integrators who use ONLYOFFICE Docs in their <b>document manager</b>.
            </p>
            <pre>
docEditor.setActionLink(link);
</pre>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>link</td>
                        <td>Defines the link which allows scrolling to the bookmark position in the document.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setFavorite" class="copy-link">setFavorite</b> - change the <em>Favorite</em> icon state. 
                This method must be called after the <a href="<%= Url.Action("config/events") %>#onMetaChange">onMetaChange</a> event.
            </p>
            <pre>
docEditor.setFavorite(favorite);
</pre>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>favorite</td>
                        <td>Defines if the <em>Favorite</em> icon is highlighted (<b>true</b>) or not (<b>false</b>).</td>
                        <td>boolean</td>
                        <td>true</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setHistoryData" class="copy-link">setHistoryData</b> - send the link to the document for viewing the version history.
                This method must be called after the <a href="<%= Url.Action("config/events") %>#onRequestHistoryData">onRequestHistoryData</a> events.
            </p>
            <pre>
docEditor.setHistoryData({
    "fileType": "docx",
    "key": "Khirz6zTPdfd7",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.iRcdHve235L5K1e29SmUBkuHcxb63WHRko51WMJlmS0",
    "url": "https://example.com/url-to-example-document.docx",
    "version": 2
});
</pre>
            <p>
                Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
                See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
            </p>
            <p>
                If after editing and saving the document the <em>changesurl</em> link to the file with changes data is returned, download the file by this link and send the file URL in the <em>changesUrl</em> parameter.
                The absolute URL address of the document previous version must be sent in the <em>previous.url</em> parameter.
            </p>
            <pre>
docEditor.setHistoryData({
    "changesUrl": "https://example.com/url-to-changes.zip",
    "fileType": "docx",
    "key": "Khirz6zTPdfd7",
    "previous": {
        "fileType": "docx",
        "key": "af86C7e71Ca8",
        "url": "https://example.com/url-to-the-previous-version-of-the-document.docx"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGFuZ2VzVXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tY2hhbmdlcy56aXAiLCJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicHJldmlvdXMiOnsiZmlsZVR5cGUiOiJkb2N4Iiwia2V5IjoiYWY4NkM3ZTcxQ2E4IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tdGhlLXByZXZpb3VzLXZlcnNpb24tb2YtdGhlLWRvY3VtZW50LmRvY3gifSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.ril3Ol3rvYne3g0dG8TdKCiwJ7-7kkYGc6-XWMvp8FU",
    "url": "https://example.com/url-to-example-document.docx",
    "version": 2
});
</pre>
            <p>
                Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
                See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
            </p>
            <p>Send an error message explaining why the document version cannot be displayed:</p>
            <pre>
docEditor.setHistoryData({
    "error": "Exception",
    "version": 2
});
</pre>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>changesUrl</td>
                        <td>
                            Defines the url address of the file with the document changes data, which can be downloaded by the <em>changesurl</em> link from <a href="<%= Url.Action("callback") %>#changesurl">the JSON object</a> returned after saving the document.
                            The request for file is signed with a token which is checked by the ONLYOFFICE Docs.
                        </td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>error</td>
                        <td>Defines the error message text.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>fileType</td>
                        <td>Defines an extension of the document specified with the <em>url</em> parameter.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>key</td>
                        <td>Defines the document identifier used to unambiguously identify the document file.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>previous</td>
                        <td>Defines the object of the previous version of the document if <em>changesUrl</em> address was returned after saving the document.</td>
                        <td>object</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>previous.fileType</td>
                        <td>Defines an extension of the document specified with the <em>previous.url</em> parameter.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>previous.key</td>
                        <td>Defines the document identifier of the previous version of the document.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>previous.url</td>
                        <td>Defines the url address of the previous version of the document.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr id="setHistoryData-token" class="tablerow">
                        <td>token</td>
                        <td>Defines the encrypted signature added to the parameter in the form of a <a href="<%= Url.Action("signature/browser") %>#setHistoryData">token</a>.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>
                            Defines the url address of the current document version.
                            Can be downloaded by the <em>url</em> link from <a href="<%= Url.Action("callback") %>#url">the JSON object</a> returned after saving the document. 
                            Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links. 
                            Otherwise, an error will occur.
                        </td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>version</td>
                        <td>Defines the document version number.</td>
                        <td>integer</td>
                        <td>required</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setMailMergeRecipients" class="copy-link">setMailMergeRecipients</b> - insert recipient data for mail merge into the file.
                This method must be called after the <a href="<%= Url.Action("config/events") %>#onRequestMailMergeRecipients">onRequestMailMergeRecipients</a> event.
                Deprecated since version 7.5, please use <a href="#setRequestedSpreadsheet">setRequestedSpreadsheet</a> instead.
            </p>
            <pre>
docEditor.setMailMergeRecipients({
    "fileType": "xlsx",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXJlY2lwaWVudHMueGxzeCJ9.P3TjOyX1Tv3xAVRAc8qtNb-uFLD6FH_WErag_rbI6nQ",
    "url": "https://example.com/url-to-example-recipients.xlsx"
});
</pre>
            <p>
                Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
                See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
            </p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>fileType</td>
                        <td>
                            Defines the type of spreadsheet for mail merge in the file.
                            Can be: <em>csv</em>, <em>fods</em>, <em>ods</em>, <em>ots</em>, <em>xls</em>, <em>xlsm</em>, <em>xlsx</em>, <em>xlt</em>, <em>xltm</em>, <em>xltx</em>.
                        </td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr id="setMailMergeRecipients-token" class="tablerow">
                        <td>token</td>
                        <td>Defines the encrypted signature added to the parameter in the form of a <a href="<%= Url.Action("signature/browser") %>#setMailMergeRecipients">token</a>.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>Defines the absolute URL where the source data is stored. Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links. 
                            Otherwise, an error will occur.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setReferenceData" class="copy-link">setReferenceData</b> - refresh data by a link to a file which is specified with the <em>referenceData</em>, <em>path</em>, or <em>link</em> parameters.
                This method must be called after the <a href="<%= Url.Action("config/events") %>#onRequestReferenceData">onRequestReferenceData</a> event.
            </p>
            <note>Please note that this method is executed only when the user has permissions to the file from which the data is taken.</note>
            <pre>
docEditor.setReferenceData({
    "fileType": "xlsx",
    "key": "Khirz6zTPdfd7",
    "path": "sample.xlsx",
    "referenceData": {
        "fileKey": "BCFA2CED",
        "instanceId": "https://example.com"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w",
    "url": "https://example.com/url-to-example-document.xlsx"
});
</pre>
            <p>
                Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
                See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
            </p>
            <p>Show an error message explaining if any error occurred:</p>
            <pre>
docEditor.setReferenceData({
    "error": "Exception",
});
</pre>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>error</td>
                        <td>Defines the error message text.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>fileType</td>
                        <td>Defines an extension of the document specified with the <em>url</em> parameter.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>key</td>
                        <td>
                            Defines the unique document identifier used by the service to take the data from the co-editing session.
                            In case the known key is sent, the document will be taken from the cache.
                            Every time the document is edited and saved, the key must be generated anew.
                            The document url can be used as the <b>key</b> but without the special characters and the length is limited to 128 symbols.
                        </td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>path</td>
                        <td>Defines the file name or relative path for the formula editor.
                            It is used to identify a file when the <a href="<%= Url.Action("config/events") %>#onRequestReferenceData">onRequestReferenceData</a> event is executed.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>referenceData</td>
                        <td>
                            Defines an object that is generated by the integrator to uniquely identify a file in its system.
                            This data must be the same as in the <a href="<%= Url.Action("config/document") %>#referenceData">document.referenceData</a> config parameter:
                            <ul>
                                <li>
                                    <b>fileKey</b> - the unique document identifier used by the service to get a link to the file.
                                    It must not be changed when the document is edited and saved (i.e. it is not equal to the <a href="<%= Url.Action("config/document") %>#key">document.key</a> parameter),
                                    <br />
                                    <b>type</b>: string,
                                    <br />
                                    <b>example</b>:  "BCFA2CED";
                                </li>
                                <li>
                                    <b>instanceId</b> - the unique system identifier. If the data was copied from a file on one system, and inserted into a file on another,
                                    then pasting by link will not be available and there will be no corresponding button in the context menu,
                                    <br />
                                    <b>type</b>: string,
                                    <br />
                                    <b>example</b>:  "https://example.com";
                                </li>
                            </ul>
                        </td>
                        <td>object</td>
                        <td>optional</td>
                    </tr>
                    <tr id="setReferenceData-token" class="tablerow">
                        <td>token</td>
                        <td>Defines the encrypted signature added to the parameter in the form of a <a href="<%= Url.Action("signature/browser") %>#setReferenceData">token</a>.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>Defines the URL address to download the current file.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setReferenceSource" class="copy-link">setReferenceSource</b> - change a source of the external data.
                This method can be called after the <a href="<%= Url.Action("config/events") %>#onRequestReferenceSource">onRequestReferenceSource</a> event.
            </p>
            <note>Please note that this method is executed only when the user has permissions to the file from which the data is taken.</note>
            <pre>
docEditor.setReferenceSource({
    "fileType": "xlsx",
    "key": "Khirz6zTPdfd7",
    "path": "sample.xlsx",
    "referenceData": {
        "fileKey": "BCFA2CED",
        "instanceId": "https://example.com"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w",
    "url": "https://example.com/url-to-example-document.xlsx"
});
</pre>
            <p>
                Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
                See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
            </p>
            <p>Show an error message explaining if any error occurred:</p>
            <pre>
docEditor.setReferenceSource({
    "error": "Exception",
});
</pre>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>error</td>
                        <td>Defines the error message text.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>fileType</td>
                        <td>Defines an extension of the document specified with the <em>url</em> parameter.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>key</td>
                        <td>
                            Defines the unique document identifier used by the service to take the data from the co-editing session.
                            In case the known key is sent, the document will be taken from the cache.
                            Every time the document is edited and saved, the key must be generated anew.
                            The document url can be used as the <b>key</b> but without the special characters and the length is limited to 128 symbols.
                        </td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>path</td>
                        <td>Defines the file name or relative path for the formula editor.
                            It is used to identify a file when the <a href="<%= Url.Action("config/events") %>#onRequestReferenceSource">onRequestReferenceSource</a> event is executed.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>referenceData</td>
                        <td>
                            Defines an object that is generated by the integrator to uniquely identify a file in its system.
                            This data must be the same as in the <a href="<%= Url.Action("config/document") %>#referenceData">document.referenceData</a> config parameter:
                            <ul>
                                <li>
                                    <b>fileKey</b> - the unique document identifier used by the service to get a link to the file.
                                    It must not be changed when the document is edited and saved (i.e. it is not equal to the <a href="<%= Url.Action("config/document") %>#key">document.key</a> parameter),
                                    <br />
                                    <b>type</b>: string,
                                    <br />
                                    <b>example</b>:  "BCFA2CED";
                                </li>
                                <li>
                                    <b>instanceId</b> - the unique system identifier. If the data was copied from a file on one system, and inserted into a file on another,
                                    then pasting by link will not be available and there will be no corresponding button in the context menu,
                                    <br />
                                    <b>type</b>: string,
                                    <br />
                                    <b>example</b>:  "https://example.com";
                                </li>
                            </ul>
                        </td>
                        <td>object</td>
                        <td>optional</td>
                    </tr>
                    <tr id="setReferenceSource-token" class="tablerow">
                        <td>token</td>
                        <td>Defines the encrypted signature added to the parameter in the form of a <a href="<%= Url.Action("signature/browser") %>#setReferenceSource">token</a>.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>Defines the URL address to download the current file.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setRequestedDocument" class="copy-link">setRequestedDocument<a href="#requiredDescr2" class="required">**</a></b> - select a document for comparing or combining.
                This method must be called after the <a href="<%= Url.Action("config/events") %>#onRequestSelectDocument">onRequestSelectDocument</a> event.
            </p>
            <pre>
docEditor.setRequestedDocument({
    "c": "compare",
    "fileType": "docx",
    "url": "https://example.com/url-to-example-document.docx",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8"
});
</pre>
            <p>
                Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
                See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
            </p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr class="tablerow">
                        <td>c</td>
                        <td>
                            Defines a type of document selection from the event. Can be: <em>compare</em>, <em>combine</em>. The default value is "compare".
                        </td>
                        <td>string</td>
                        <td>required</td>
                    </tr><tr class="tablerow">
                        <td>fileType</td>
                        <td>
                            Defines a type of the document to be selected.
                            Can be: <em>doc</em>, <em>docm</em>, <em>docx</em>, <em>dot</em>, <em>dotm</em>, <em>dotx</em>, <em>epub</em>, <em>fodt</em>, <em>odt</em>, <em>ott</em>, <em>rtf</em>, <em>wps</em>.
                        </td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr id="setRequestedDocument-token" class="tablerow">
                        <td>token</td>
                        <td>Defines the encrypted signature added to the parameter in the form of a <a href="<%= Url.Action("signature/browser") %>#setRequestedDocument">token</a>.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>Defines the absolute URL where the source document is stored. Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links.
                            Otherwise, an error will occur.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setRequestedSpreadsheet" class="copy-link">setRequestedSpreadsheet</b> - insert recipient data for mail merge into the file.
                This method must be called after the <a href="<%= Url.Action("config/events") %>#onRequestSelectSpreadsheet">onRequestSelectSpreadsheet</a> event.
            </p>
            <pre>
docEditor.setRequestedSpreadsheet({
    "c": "mailmerge";
    "fileType": "xlsx",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXJlY2lwaWVudHMueGxzeCJ9.P3TjOyX1Tv3xAVRAc8qtNb-uFLD6FH_WErag_rbI6nQ",
    "url": "https://example.com/url-to-example-recipients.xlsx"
});
</pre>
            <p>
                Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
                See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
            </p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>c</td>
                        <td>
                            Defines a type of spreadsheet selection from the event. Can be <em>mailmerge</em>.
                        </td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>fileType</td>
                        <td>
                            Defines the type of spreadsheet for mail merge in the file.
                            Can be: <em>csv</em>, <em>fods</em>, <em>ods</em>, <em>ots</em>, <em>xls</em>, <em>xlsm</em>, <em>xlsx</em>, <em>xlt</em>, <em>xltm</em>, <em>xltx</em>.
                        </td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr id="setRequestedSpreadsheet-token" class="tablerow">
                        <td>token</td>
                        <td>Defines the encrypted signature added to the parameter in the form of a <a href="<%= Url.Action("signature/browser") %>#setRequestedSpreadsheet">token</a>.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>Defines the absolute URL where the source data is stored. Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links.
                            Otherwise, an error will occur.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setRevisedFile" class="copy-link">setRevisedFile<a href="#requiredDescr2" class="required">**</a></b> - select a document for comparing.
                This method must be called after the <a href="<%= Url.Action("config/events") %>#onRequestCompareFile">onRequestCompareFile</a> events.
                Deprecated since version 7.5, please use <a href="#setRequestedDocument">setRequestedDocument</a> instead.
            </p>
            <pre>
docEditor.setRevisedFile({
    "fileType": "docx",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8",
    "url": "https://example.com/url-to-example-document.docx"
});
</pre>
            <p>
                Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
                See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
            </p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>fileType</td>
                        <td>
                            Defines the type of document for comparing.
                            Can be: <em>doc</em>, <em>docm</em>, <em>docx</em>, <em>dot</em>, <em>dotm</em>, <em>dotx</em>, <em>epub</em>, <em>fodt</em>, <em>odt</em>, <em>ott</em>, <em>rtf</em>, <em>wps</em>.
                        </td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr id="setRevisedFile-token" class="tablerow">
                        <td>token</td>
                        <td>Defines the encrypted signature added to the parameter in the form of a <a href="<%= Url.Action("signature/browser") %>#setRevisedFile">token</a>.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>Defines the absolute URL where the source document is stored. Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links. 
                            Otherwise, an error will occur.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setSharingSettings" class="copy-link">setSharingSettings</b> - update the <a href="<%= Url.Action("config/document/info") %>#sharingSettings">information</a> about the settings which allow to share the document with other users.
                This method can be called after the <a href="<%= Url.Action("config/events") %>#onRequestSharingSettings">onRequestSharingSettings</a> events.
            </p>
            <pre>
docEditor.setSharingSettings({
    "sharingSettings": [
        {
            "permissions": "Full Access",
            "user": "John Smith"
        },
        {
            "isLink": true,
            "permissions": "Read Only",
            "user": "External link"
        }
    ]
});
</pre>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>sharingSettings</td>
                        <td>Defines the settings which allow sharing the document with other users.</td>
                        <td>array of object</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>sharingSettings.permissions</td>
                        <td>Defines the access rights for the user with the name above.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>sharingSettings.user</td>
                        <td>Defines the name of the user with whom the document will be shared.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setUsers" class="copy-link">setUsers</b> - set a list of users to mention in the comments, grant the access rights to edit the specific sheet ranges, or set the user avatars.
                This method must be called after the <a href="<%= Url.Action("config/events") %>#onRequestUsers">onRequestUsers</a> events.
            </p>
            <pre>
docEditor.setUsers({
    "c": "protect",
    "users": [
        {
            "email": "john@example.com",
            "id": "78e1e841",
            "image": "https://example.com/url-to-user-avatar1.png",
            "name": "John Smith"
        },
        {
            "email": "kate@example.com",
            "id": "F89d8069ba2b",
            "image": "https://example.com/url-to-user-avatar2.png",
            "name": "Kate Cage"
        },
        ...
    ]
});
</pre>
            <p>
                Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
                See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
            </p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>c</td>
                        <td>
                            Defines the operation type from the <a href="<%= Url.Action("config/events") %>#onRequestUsers">onRequestUsers</a> event.
                            It can take one of the following values - <em>mention</em>, <em>protect</em>, or <em>info</em>.
                            The default value is <em>mention</em>.
                        </td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>users</td>
                        <td>Defines the list of the users.</td>
                        <td>array of strings</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>users.email</td>
                        <td>Defines the email address of the user. This field is required when the <em>c</em> parameter is <em>mention</em>.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>users.id</td>
                        <td>Defines the identification of the user. This field is required when the <em>c</em> parameter is <em>protect</em>.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>users.image</td>
                        <td>Defines the path to the user's avatar. This field is required when the <em>c</em> parameter is <em>info</em>.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>users.name</td>
                        <td>Defines the full name of the user.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <div class="note">Please note that the request to the user's avatar is sent without authorization because the avatar URL is inserted into the HTML of the editor frame.
                Moreover, the CORS problem may occur. In this case, use the avatar in the base64 format. For example, <em>"data:image/png,base64,*****"</em>.</div>
            <div class="note">Please note that if you are subscribed to the <em>onRequestUsers</em> event and send an avatar using the <em>setUsers</em> method,
                the <a href="<%= Url.Action("config/editor") %>#user">user.image</a> field in the initialization config is not required.
            We especially don't recommend to specify this parameter if the avatar is sent in the base64 format and the initialization config is signed with JWT.
            In this case, the token will be too long.</div>
        </li>

        <li>
            <p>
                <b id="showMessage" class="copy-link">showMessage</b> - display a tooltip with a message.
                This method can be called only after the <a href="<%= Url.Action("config/events") %>#onAppReady">onAppReady</a> events.
            </p>
            <pre>
docEditor.showMessage(message);
</pre>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>message</td>
                        <td>Defines the message text.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <note>
                Please note that displaying a tooltip with a message is not supported in the embedded platform <a href="<%= Url.Action("config") %>#type">type</a>.
            </note>
        </li>

        <li>
            <p>
                <b id="startFilling" class="copy-link">startFilling</b> - start filling out the ready forms and lock the pdf editing (only pdf viewing becomes available).
                This method can be called only after the <a href="<%= Url.Action("config/events") %>#onRequestStartFilling">onRequestStartFilling</a> event.
            </p>
            <pre>
docEditor.startFilling();
</pre>
        </li>
    </ul>
    <span id="requiredDescr" class="required-descr"><span class="required">*</span><em> - available for editing only for ONLYOFFICE Developer Edition</em></span>
    <span id="requiredDescr2" class="required-descr"><span class="required">**</span><em> - available only for ONLYOFFICE Enterprise Edition and ONLYOFFICE Developer Edition</em></span>

</asp:Content>
