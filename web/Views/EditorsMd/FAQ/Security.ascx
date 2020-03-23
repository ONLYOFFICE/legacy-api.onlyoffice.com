<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Document Server FAQ: <br />
        Security questions</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="security_1">
    <dt>How to limit access to my Document Server?</dt>
    <dd>
        <p>To prevent an unauthorized access to your documents and the substitution of important parameters in ONLYOFFICE Document Server requests, it uses a JSON Web Token (JWT) compatible tokens to ensure security. The tokens are signed by the server key, so the client is able to verify that the token is legitimate.</p>
        <p>The <b>token</b> is added in the configuration when initializing Document Server and during the exchange of commands between <b>document storage service</b> and <b>document editing service</b>, <b>document command service</b> and <b>document conversion service</b>.</p>
        <p>Document Server validates the token. If it is valid, the data from the <em>payload</em> is used instead of the corresponding data from the main parameters. If the token is invalid, the command is not executed and no parameters are used or changed.</p>
        <p>The token can be sent both in the request <a href="<%= Url.Action("signature/request") %>">header</a> or <a href="<%= Url.Action("signature/body") %>">body</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="security_2">
    <dt>What's the difference between sending the token in header and in body?</dt>
    <dd>
        <p>Starting with version 5.2 of Document Server it is possible to send token both in the request header and body. The main difference between these two methods is in the length limitation: a HTTP header has length limitation and some servers (such as some NGINX versions) do not accept the requests with the header longer than 4 kilobytes, while other servers restrict the header length to 8&ndash;48 kilobytes. In case the header length exceeds these values, the server will return the <em>413 Entity Too Large</em> error.</p>
        <p>To avoid this limitation, sending the token in the request body should be the preferred method of doing this. To enable it set the <em>services.CoAuthoring.token.inbox.inBody</em> and <em>services.CoAuthoring.token.outbox.inBody</em> in the <em>local.json</em> configuration file to <b>true</b> (the default values are set to <b>false</b>):</p>
        <pre>{
    "services": {
        "CoAuthoring": {
            "token": {
                "inbox": {
                    "inBody": true,
                },
                "outbox": {
                    "inBody": true
                }
            }
        }
    }
}</pre>
        <p>See the <a href="<%= Url.Action("signature/request") %>">Request with token in header</a> or <a href="<%= Url.Action("signature/body") %>">Request with token in body</a> sections for more details on this.</p>
    </dd>
</dl>