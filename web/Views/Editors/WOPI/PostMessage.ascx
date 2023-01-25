﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">PostMessage</span>
</h1>

    <p class="dscr">
        <a href="https://docs.microsoft.com/zh-cn/microsoft-365/cloud-storage-partner-program/online/scenarios/postmessage" target="_blank">PostMessage</a> 是 <a href="https://html.spec.whatwg.org/multipage/web-messaging.html#posting-messages" target="_blank">HTML5 Web 消息传递</a> 协议，它允许在 iframe 存储和 ONLYOFFICE Docs 之间在浏览器中交换消息。
        它允许online office框架与其父主机页面进行通信。
    </p>

    <pre>
otherWindow.postMessage (msg, targetOrigin)
</pre>

    <div class="header-gray">参数</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>名称</td>
                <td>描述</td>
                <td>类型</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="msg" class="copy-link">msg</td>
                <td>消息数据：
                    <ul>
                        <li>
                            <b>MessageId</b> - 消息名称，
                            <br />
                            <b>类型</b>：string，
                            <br />
                            <b>例如</b>："App_LoadingStatus"；
                        </li>
                        <li>
                            <b>SendTime</b> - 消息发送的时间，以 UTC 1970 年 1 月 1 日午夜以来的毫秒数表示，
                            <br />
                            <b>类型</b>：integer，
                            <br />
                            <b>例如</b>：1329014075000；
                        </li>
                        <li>
                            <b>Values</b> - 消息属性，
                            <br />
                            <b>类型</b>：JSON 对象。
                        </li>
                    </ul>
                </td>
                <td>string 或 JSON 对象</td>
            </tr>
            <tr>
                <td id="targetOrigin" class="copy-link">targetOrigin</td>
                <td>
                    <em>otherWindow</em> 原点必须是要调度的事件。
                    它将被设置为 <em>CheckFileInfo</em>中提供的 <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#PostMessageOrigin">PostMessageOrigin</a> 属性。
                    <br />
                    *<em>otherWindow</em> 是对 <em>msg</em> 将被发布到的另一个窗口的引用。
                </td>
                <td>string</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <p>在这里，您可以找到可供 ONLYOFFICE Docs 发送到主机页面的消息。Online office接收消息的过程将在稍后提供。</p>
    <div class="header-gray">可用消息</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>MessageId</td>
                <td>描述</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="App_LoadingStatus" class="copy-link">App_LoadingStatus</td>
                <td>此消息是在加载online office应用程序框架后被发布的。
                    在主机收到此消息之前，它必须假定online office 框架无法对除 <a href="#Host_PostmessageReady">Host_PostmessageReady</a>之外的任何传入消息做出反应。</td>
            </tr>
            <tr>
                <td id="Blur_Focus" class="copy-link">Blur_Focus</td>
                <td>This message is posted by the host to stop the online office application from aggressively grabbing focus.
                    Hosts should send this message whenever the host application UI is drawn over the online office frame so that the online office application does not interfere with the host UI behavior.
                    This message is used only for the edit modes. It does not affect view modes.</td>
            </tr>
            <tr>
                <td id="Edit_Notification" class="copy-link">Edit_Notification</td>
                <td>此消息在用户首次对文档进行编辑时被发布，此后每五分钟被发布一次(如果用户在过去五分钟内进行了编辑)。
                    主机可以使用此消息来衡量用户是否正在与online office进行交互。在共同创作会话中，主机不能为此目的使用 WOPI 调用。</td>
            </tr>
            <tr>
                <td id="File_Rename" class="copy-link">File_Rename</td>
                <td>当用户重命名online office中的当前文件时，会发布此消息。主机可以使用此消息选择性地更新 UI，例如页面标题。</td>
            </tr>
            <tr>
                <td id="Grab_Focus" class="copy-link">Grab_Focus</td>
                <td>This message is posted by the host to resume aggressively grabbing focus by the online office application.
                    Hosts should send this message whenever the host application UI that's drawn over the online office frame is closing. This lets the online office application resume functioning.
                    This message is used only for the edit modes. It does not affect view modes.</td>
            </tr>
            <tr>
                <td id="Host_PostmessageReady" class="copy-link">Host_PostmessageReady</td>
                <td>This message is posted by the host when it finishes loading. Then the online office frame receives <em>Host_PostmessageReady</em>,
                finishes loading, and sends the <a href="#App_LoadingStatus">App_LoadingStatus</a> message to the host page. After that, all the other PostMessage messages become available.</td>
            </tr>
            <tr>
                <td id="UI_Close" class="copy-link">UI_Close</td>
                <td>由于错误或用户操作，online office 应用程序关闭时会发布此消息。
                    要发送此消息，来自主机的 <em>CheckFileInfo</em> 响应中的 <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#ClosePostMessage">ClosePostMessage</a> 属性必须设置为<b>true</b>。
                    否则，online office 将不会发送此消息。</td>
            </tr>
            <tr>
                <td id="UI_Edit" class="copy-link">UI_Edit</td>
                <td>当用户激活online office中的 <em>编辑</em> UI 时，会发送此消息。此 UI 仅在使用视图操作时可见。
                    要发送此消息，来自主机的 <em>CheckFileInfo</em> 响应中的 <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#EditModePostMessage">EditModePostMessage</a> 属性必须设置为 <b>true</b>。
                    否则，online office将不会发送此消息，而是会将内部 iframe 重定向到编辑操作 URL。</td>
            </tr>
            <tr>
                <td id="UI_FileVersions" class="copy-link">UI_FileVersions</td>
                <td>当用户在online office中激活 <em>以前的版本</em> UI 时，会发布此消息。主机应使用此消息来触发任何自定义文件版本历史 UI。
                    要发送此消息，来自主机的 <em>CheckFileInfo</em> 响应中的 <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#FileVersionPostMessage">FileVersionPostMessage</a> 属性必须设置为 <b>true</b>。
                    否则，online office将不会发送此消息。</td>
            </tr>
            <tr>
                <td id="UI_Sharing" class="copy-link">UI_Sharing</td>
                <td>当用户激活online office中的 <em>共享</em> UI 时，会发布此消息。主机应使用此消息来触发任何自定义共享 UI。
                    要发送此消息，来自主机的 <em>CheckFileInfo</em> 响应中的 <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#FileSharingPostMessage">FileSharingPostMessage</a> 属性必须设置为 <b>true</b>。
                    否则，online office将不会发送此消息。</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Collabora特性</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>MessageId</td>
                <td>描述</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="Action_InsertGraphic" class="copy-link">Action_InsertGraphic</td>
                <td>This message is posted to download an image from the URL and insert it into the document.</td>
            </tr>
            <tr>
                <td id="UI_InsertGraphic" class="copy-link">UI_InsertGraphic</td>
                <td>This message is posted to display a user interface element (for example, a dialog) allowing the user to pick an image from the integration.
                The integration is supposed to provide a temporary URL that may be downloaded once, and return it back
                via the <a href="#Action_InsertGraphic">Action_InsertGraphic</a> message with <em>Values</em> set to the temporary URL.</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <note>请注意，PostMessage 消息的优先级高于 <em>CheckFileInfo</em>中提供的 <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#CloseUrl">CloseUrl</a>、
    <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#HostEditUrl">HostEditUrl</a>、<a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#FileSharingUrl">FileSharingUrl</a>、
    <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#FileVersionUrl">FileVersionUrl</a> 属性。</note>
