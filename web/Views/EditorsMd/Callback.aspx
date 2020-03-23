﻿<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Callback handler
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Callback handler</span>
    </h1>

    <p class="dscr">
        The <b>document editing service</b> informs the <b>document storage service</b> about the status of the document editing using the <em>callbackUrl</em> from <a href="<%= Url.Action("basic") %>">JavaScript API</a>.
        The <b>document editing service</b> use the POST request with the information in body.
    </p>

    <h2>Parameters and their description:</h2>
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
                <td id="actions" class="copy-link">actions</td>
                <td>
                    Defines the object received if the new user connected to the document co-editing or disconnected from it.
                    In the first case the <em>type</em> field value is <b>1</b>, in the other case - <b>0</b>. The <em>userid</em> field value is the identifier of the user who connected to or disconnected from the document co-editing.
                </td>
                <td>array of object</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="changeshistory" class="copy-link">changeshistory</td>
                <td>
                    Defines the array of objects with the document changes history.
                    The object is present when the <em>status</em> value is equal to <b>2</b> or <b>3</b> only. Must be sent as a property <em>changes</em> of the object sent as the argument to the <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> method.
                    Removed since version 4.2, please use <a href="#history">history</a> instead.
                </td>
                <td>array of object</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="changesurl" class="copy-link">changesurl</td>
                <td>
                    Defines the link to the file with the document editing data used to track and display the document changes history.
                    The link is present when the <em>status</em> value is equal to <b>2</b> or <b>3</b> only. The file must be saved and its address must be sent as <i>changesUrl</i> parameter using the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method to show the changes corresponding to the specific document version.
                </td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="forcesavetype" class="copy-link">forcesavetype</td>
                <td>
                    Defines the type of initiator when the <a href="<%= Url.Action("save") %>#forcesave">force saving</a> request is performed.
                    Can have the following values:
                    <ul>
                        <li><b>0</b> - the force saving request is performed to the <a href="<%= Url.Action("command") %>">command service</a>,</li>
                        <li><b>1</b> - the force saving request is performed each time the saving is done (e.g. the <b>Save</b> button is clicked), which is only available when the <a href="<%= Url.Action("config/editor/customization") %>#forcesave">forcesave</a> option is set to <em>true</em>.</li>
                        <li><b>2</b> - the force saving request is performed by timer with the settings from the server config.</li>
                    </ul>
                    The type is present when the <em>status</em> value is equal to <b>6</b> or <b>7</b> only.
                </td>
                <td>integer</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="history" class="copy-link">history</td>
                <td>
                    Defines the object with the document changes history.
                    The object is present when the <em>status</em> value is equal to <b>2</b> or <b>3</b> only. It contains the object <em>serverVersion</em> and <em>changes</em>, which must be sent as properties <em>serverVersion</em> and <em>changes</em> of the object sent as the argument to the <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> method.
                </td>
                <td>object</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="key" class="copy-link">key</td>
                <td>Defines the edited document identifier.</td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td id="status" class="copy-link">status</td>
                <td>
                    Defines the status of the document.
                    Can have the following values:
                    <ul>
                        <li><b>1</b> - document is being edited,</li>
                        <li><b>2</b> - document is ready for saving,</li>
                        <li><b>3</b> - document saving error has occurred,</li>
                        <li><b>4</b> - document is closed with no changes,</li>
                        <li><b>6</b> - document is being edited, but the current document state is saved,</li>
                        <li><b>7</b> - error has occurred while force saving the document.</li>
                    </ul>
                </td>
                <td>integer</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td id="url" class="copy-link">url</td>
                <td>
                    Defines the link to the edited document to be saved with the document storage service.
                    The link is present when the <em>status</em> value is equal to <b>2</b> or <b>3</b> only.
                </td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="userdata" class="copy-link">userdata</td>
                <td>Defines the custom information sent to the <a href="<%= Url.Action("command") %>#userdata">command service</a> in case it was present in the request.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="users" class="copy-link">users</td>
                <td>Defines the list of the identifiers of the users who opened the document for editing; when the document has been changed the <b>users</b> will return the identifier of the user who was the last to edit the document (for status <b>2</b> and status <b>6</b> replies).</td>
                <td>array of string</td>
                <td>optional</td>
            </tr>
        </tbody>
    </table>
    
    <p id="used-callbackUrl" class="copy-link">
        Since version 5.5, <a href="<%= Url.Action("config/editor") %>#callbackUrl">callbackUrl</a> is selected depending on the <em>status</em> of the request.
        Starting from version 4.4 to version 5.5, <em>callbackUrl</em> is used from the last user who joined the co-editing.
        Prior to version 4.4, when co-editing, <em>callbackUrl</em> is used from the user who first opened the file for editing.
    </p>
    <p>
        <em>Status</em> <b>1</b> is received every user connection to or disconnection from document co-editing.
        His <em>callbackUrl</em> is used.
    </p>
    <p>
        <em>Status</em> <b>2</b> (<b>3</b>) is received <a href="<%= Url.Action("save") %>#savedelay">10 seconds</a> after the document is closed for editing with the identifier of the user who was the last to send the changes to the document editing service.
        The <em>callbackUrl</em> from the user who made the last changes to the file is used.
    </p>
    <p>
        <em>Status</em> <b>4</b> is received after the document is closed for editing with no changes by the last user.
        His <em>callbackUrl</em> is used.
    </p>
    <p>
        <em>Status</em> <b>6</b> (<b>7</b>) is received when the force saving request is performed.
        The <em>callbackUrl</em> from the user who made the last changes to the file is used.
    </p>

    <div id="status-1" class="header-gray copy-link">Sample of JSON object sent to the "callbackUrl" address by document editing service when two users are co-editing the document</div>
    <pre>
{
    "actions": [{"type": 1, "userid": "78e1e841"}],
    "key": "Khirz6zTPdfd7",
    "status": 1,
    "users": ["6d5a81d0", "78e1e841"]
}
</pre>

    <div id="status-2" class="header-gray copy-link">Sample of JSON object sent to the "callbackUrl" address by document editing service when the user changed the document and closed it for editing</div>
    <pre>
{
    "actions": [{"type": 0, "userid": "78e1e841"}],
    "changesurl": "https://documentserver/url-to-changes.zip",
    "history": {
        "changes": changes,
        "serverVersion": serverVersion
    },
    "key": "Khirz6zTPdfd7",
    "status": 2,
    "url": "https://documentserver/url-to-edited-document.docx",
    "users": ["6d5a81d0"]
}
</pre>

    <div id="status-4" class="header-gray copy-link">Sample of JSON object sent to the "callbackUrl" address by document editing service when the last user closed the document for editing without changes</div>
    <pre>
{
    "key": "Khirz6zTPdfd7",
    "status": 4
}
</pre>

    <div id="status-6" class="header-gray copy-link">Sample of JSON object sent to the "callbackUrl" address by document editing service after the <a href="<%= Url.Action("command") %>">forcesave</a> command had been received</div>
    <pre>
{
    "changesurl": "https://documentserver/url-to-changes.zip",
    "forcesavetype": 0,
    "history": {
        "changes": changes,
        "serverVersion": serverVersion
    },
    "key": "Khirz6zTPdfd7",
    "status": 6,
    "url": "https://documentserver/url-to-edited-document.docx",
    "users": ["6d5a81d0"],
    "userdata": "sample userdata"
}
</pre>

    <div id="error-0" class="header-gray copy-link">Response from the document storage service</div>

    <p>The <b>document storage service</b> must return the following response, otherwise the <b>document editor</b> will display an error message:</p>
    <pre>
{
    "error": 0
}
</pre>

    <p id="implement">The <b>document manager</b> and <b>document storage service</b> are either included to Community Server or must be implemented by the software integrators who use ONLYOFFICE Document Server on their own server.</p>

    <div id="csharp" class="header-gray copy-link">.Net (C#) document save example</div>
    <pre>
public class WebEditor : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string body;
        using (var reader = new StreamReader(context.Request.InputStream))
            body = reader.ReadToEnd();

        var fileData = new JavaScriptSerializer().Deserialize&lt;Dictionary&lt;string, object&gt;&gt;(body);
        if ((int) fileData["status"] == 2)
        {
            var req = WebRequest.Create((string) fileData["url"]);

            using (var stream = req.GetResponse().GetResponseStream())
            using (var fs = File.Open(PATH_FOR_SAVE, FileMode.Create))
            {
                var buffer = new byte[4096];
                int readed;
                while ((readed = stream.Read(buffer, 0, 4096)) != 0)
                    fs.Write(buffer, 0, readed);
            }
        }
        context.Response.Write("{\"error\":0}");
    }
}
</pre>
    <div class="note"><em>PATH_FOR_SAVE</em> is the absolute path to your computer folder where the file will be saved including the file name.</div>

    <div id="java" class="header-gray copy-link">Java document save example</div>
    <pre>
public class IndexServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();

        Scanner scanner = new Scanner(request.getInputStream()).useDelimiter("\\A");
        String body = scanner.hasNext() ? scanner.next() : "";

        JSONObject jsonObj = (JSONObject) new JSONParser().parse(body);

        if((long) jsonObj.get("status") == 2)
        {
            String downloadUri = (String) jsonObj.get("url");

            URL url = new URL(downloadUri);
            java.net.HttpURLConnection connection = (java.net.HttpURLConnection) url.openConnection();
            InputStream stream = connection.getInputStream();

            File savedFile = new File(pathForSave);
            try (FileOutputStream out = new FileOutputStream(savedFile)) {
                int read;
                final byte[] bytes = new byte[1024];
                while ((read = stream.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                }

                out.flush();
            }

            connection.disconnect();
        }
        writer.write("{\"error\":0}");
    }
}
</pre>
    <div class="note"><em>pathForSave</em> is the absolute path to your computer folder where the file will be saved including the file name.</div>

    <div id="nodejs" class="header-gray copy-link">Node.js document save example</div>
    <pre>
var fs = require("fs");

app.post("/track", function (req, res) {

    var updateFile = function (response, body, path) {
        if (body.status == 2)
        {
            var file = syncRequest("GET", body.url);
            fs.writeFileSync(path, file.getBody());
        }

        response.write("{\"error\":0}");
        response.end();
    }

    var readbody = function (request, response, path) {
        var content = "";
        request.on("data", function (data) {
            content += data;
        });
        request.on("end", function () {
            var body = JSON.parse(content);
            updateFile(response, body, path);
        });
    }

    if (req.body.hasOwnProperty("status")) {
        updateFile(res, req.body, pathForSave);
    } else {
        readbody(req, res, pathForSave)
    }
});
</pre>
    <div class="note"><em>pathForSave</em> is the absolute path to your computer folder where the file will be saved including the file name.</div>

    <div id="php" class="header-gray copy-link">PHP document save example</div>
    <pre>
&lt;?php

if (($body_stream = file_get_contents("php://input"))===FALSE){
    echo "Bad Request";
}

$data = json_decode($body_stream, TRUE);

if ($data["status"] == 2){
    $downloadUri = $data["url"];
        
    if (($new_data = file_get_contents($downloadUri))===FALSE){
        echo "Bad Response";
    } else {
        file_put_contents($path_for_save, $new_data, LOCK_EX);
    }
}
echo "{\"error\":0}";

?&gt;
</pre>
    <div class="note"><em>$path_for_save</em> is the absolute path to your computer folder where the file will be saved including the file name.</div>

    <div id="ruby" class="header-gray copy-link">Ruby document save example</div>
    <pre>
class ApplicationController < ActionController::Base
    def index
        body = request.body.read

        file_data = JSON.parse(body)
        status = file_data["status"].to_i

        if status == 2
            download_uri = file_data["url"]
            uri = URI.parse(download_uri)
            http = Net::HTTP.new(uri.host, uri.port)

            if download_uri.start_with?("https")
                http.use_ssl = true
                http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            end

            req = Net::HTTP::Get.new(uri.request_uri)
            res = http.request(req)
            data = res.body

            File.open(path_for_save, "wb") do |file|
                file.write(data)
            end
        end
        render :text => "{\"error\":0}"
    end
end
</pre>
    <div class="note"><em>path_for_save</em> is the absolute path to your computer folder where the file will be saved including the file name.</div>

</asp:Content>

