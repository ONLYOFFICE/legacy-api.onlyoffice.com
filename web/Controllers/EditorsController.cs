/*
 *
 * (c) Copyright Ascensio System SIA 2024
 *
 * This program is freeware. You can redistribute it and/or modify it under the terms of the GNU 
 * General Public License (GPL) version 3 as published by the Free Software Foundation (https://www.gnu.org/copyleft/gpl.html). 
 * In accordance with Section 7(a) of the GNU GPL its Section 15 shall be amended to the effect that 
 * Ascensio System SIA expressly excludes the warranty of non-infringement of any third-party rights.
 *
 * THIS PROGRAM IS DISTRIBUTED WITHOUT ANY WARRANTY; WITHOUT EVEN THE IMPLIED WARRANTY OF MERCHANTABILITY OR
 * FITNESS FOR A PARTICULAR PURPOSE. For more details, see GNU GPL at https://www.gnu.org/copyleft/gpl.html
 *
 * You can contact Ascensio System SIA by email at sales@onlyoffice.com
 *
 * The interactive user interfaces in modified source and object code versions of ONLYOFFICE must display 
 * Appropriate Legal Notices, as required under Section 5 of the GNU GPL version 3.
 *
 * Pursuant to Section 7 § 3(b) of the GNU GPL you must retain the original ONLYOFFICE logo which contains 
 * relevant author attributions when distributing the software. If the display of the logo in its graphic 
 * form is not reasonably feasible for technical reasons, you must include the words "Powered by ONLYOFFICE" 
 * in every copy of the program you distribute. 
 * Pursuant to Section 7 § 3(e) we decline to grant you any rights under trademark law for use of our trademarks.
 *
*/


using System;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web.WebPages;
using ASC.Api.Web.Help.Helpers;
using log4net;
using Newtonsoft.Json;

namespace ASC.Api.Web.Help.Controllers
{
    [Redirect]
    public class EditorsController : AsyncController
    {
        private readonly string[] _actionMap = new[]
            {
                "ActionLink",
                "Advanced",
                "Alfresco",
                "Angular",
                "AnonymousUsers",
                "Basic",
                "Callback",
                "Chamilo",
                "Changelog",
                "Coedit",
                "Command",
                "Command/deleteforgotten",
                "Command/drop",
                "Command/getforgotten",
                "Command/getforgottenlist",
                "Command/forcesave",
                "Command/info",
                "Command/license",
                "Command/meta",
                "Command/version",
                "Commenting",
                "Comparing",
                "Config",
                "Config/Document",
                "Config/Document/Info",
                "Config/Document/Permissions",
                "Config/Editor",
                "Config/Editor/Customization",
                "Config/Editor/Embedded",
                "Config/Editor/Plugins",
                "Config/Events",
                "ConfigCreate",
                "Confluence",
                "Connector",
                "Conversion",
                "ConversionApi",
                "DemoPreview",
                "DocumentBuilderApi",
                "Drupal",
                "EmbeddingForms",
                "Example/Java",
                "Example/JavaSpring",
                "Example/Nodejs",
                "Example/Php",
                "Example/Ruby",
                "Example/Python",
                "Example/Csharp",
                "FAQ",
                "FAQ/Coediting",
                "FAQ/Customizing",
                "FAQ/Editing",
                "FAQ/Embedding",
                "FAQ/General",
                "FAQ/Integrating",
                "FAQ/ManagingVersions",
                "FAQ/Renaming",
                "FAQ/Saving",
                "FAQ/Security",
                "FAQ/Sharing",
                "FAQ/UsingWOPI",
                "Frameworks",
                "GetDocs",
                "History",
                "HowItWorks",
                "HumHub",
                "InlineEditors",
                "InsertingExternalData",
                "InteractingOutside",
                "InteractingOutside/Comments",
                "InteractingOutside/FillingForm",
                "InteractingOutside/ReviewWork",
                "InteractingOutside/GettingData",
                "JavaSdk",
                "Jira",
                "Liferay",
                "Mattermost",
                "Mentions",
                "Methods",
                "MobileIntegration",
                "Moodle",
                "Nextcloud",
                "Nuxeo",
                "Odoo",
                "Open",
                "OwnCloud",
                "Plone",
                "Plugins",
                "ProtectingRanges",
                "React",
                "Redmine",
                "Rename",
                "Review",
                "Save",
                "Security",
                "SettingAvatars",
                "SharePoint",
                "Signature",
                "Signature/Body",
                "Signature/Browser",
                "Signature/Request",
                "Strapi",
                "SuiteCRM",
                "Troubleshooting",
                "Try",
                "Viewing",
                "Vue",
                "WOPI",
                "WOPI/ApiVsWopi",
                "WOPI/ConversionApi",
                "WOPI/Discovery",
                "WOPI/EditingBinary",
                "WOPI/HostPage",
                "WOPI/PostMessage",
                "WOPI/ProofKeys",
                "WOPI/RestApi",
                "WOPI/RestApi/CheckFileInfo",
                "WOPI/RestApi/GetFile",
                "WOPI/RestApi/Lock",
                "WOPI/RestApi/PutFile",
                "WOPI/RestApi/PutRelativeFile",
                "WOPI/RestApi/RefreshLock",
                "WOPI/RestApi/RenameFile",
                "WOPI/RestApi/Unlock",
                "Wordpress"
            };

        [ValidateInput(false)]
        public ActionResult Search(string query)
        {
            return View(GCustomSearch.Search(query, "editors"));
        }


        public ActionResult Navigation()
        {
            return View();
        }


        public ActionResult Index()
        {
            return View("Basic");
        }


        public ActionResult ActionLink()
        {
            return View();
        }

        public ActionResult Advanced()
        {
            return View();
        }

        public ActionResult Alfresco()
        {
            return View();
        }

        public ActionResult Angular()
        {
            return View();
        }

        public ActionResult AnonymousUsers()
        {
            return View();
        }

        public ActionResult Basic()
        {
            return View();
        }

        public ActionResult Callback()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Callback(string data)
        {
            return Json(new { error = 0 });
        }

        public ActionResult Chamilo()
        {
            return View();
        }

        public ActionResult Changelog()
        {
            return View();
        }

        public ActionResult Coedit()
        {
            return View();
        }

        public ActionResult Command(string catchall)
        {
            if (!_actionMap.Contains("command/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("Command", (object)catchall);
        }

        public ActionResult Commenting()
        {
            return View();
        }

        public ActionResult Comparing()
        {
            return View();
        }

        public ActionResult Config(string catchall)
        {
            if (!_actionMap.Contains("config/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("Config", (object) catchall);
        }

        [HttpOptions]
        public void ConfigCreate()
        {
            Response.AddHeader("Access-Control-Allow-Origin", "*");
            Response.AddHeader("Access-Control-Allow-Methods", "POST, OPTIONS");
            Response.AddHeader("Access-Control-Allow-Headers", "Content-Type");
        }

        [HttpPost]
        public ContentResult ConfigCreate([ModelBinder(typeof(JsonModelBinder))] Config config)
        {
            Response.AddHeader("Access-Control-Allow-Origin", "*");
            Response.AddHeader("Access-Control-Allow-Methods", "POST, OPTIONS");
            Response.AddHeader("Access-Control-Allow-Headers", "Content-Type");
            LogManager.GetLogger("ASC.Api").Debug("Editor Config create: " + JsonConvert.SerializeObject(config));


            if (config.Document == null) config.Document = new Config.DocumentConfig();

            if (config.DocumentType.IsEmpty())
            {
                config.DocumentType = "word";
                config.Document.FileType = "docx";
            }
            config.Document.FileType = !config.Document.FileType.IsEmpty()
                ? config.Document.FileType
                : "docx";
            config.Document.Key = "apiwh" + Guid.NewGuid();
            config.Document.Title = !config.Document.Title.IsEmpty()
                ? config.Document.Title
                : "Example Title." + config.Document.FileType;
            config.Document.Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo." + config.Document.FileType;
            config.EditorConfig.CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme);

            return Content(Helpers.Config.Serialize(config), "application/json");
        }

        internal class JsonModelBinder : IModelBinder
        {
            public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
            {
                controllerContext.HttpContext.Request.InputStream.Position = 0;
                var stream = controllerContext.RequestContext.HttpContext.Request.InputStream;
                var readStream = new StreamReader(stream, Encoding.UTF8);
                var json = readStream.ReadToEnd();
                return JsonConvert.DeserializeObject(json, bindingContext.ModelType);
            }
        }

        public ActionResult Confluence()
        {
            return View();
        }

        public ActionResult Connector()
        {
            return View();
        }

        public ActionResult Conversion()
        {
            return View();
        }

        public ActionResult ConversionApi()
        {
            return View();
        }

        public ActionResult Example(string catchall)
        {
            if (!_actionMap.Contains("example/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("Example", (object)catchall);
        }

        public ActionResult FAQ(string catchall)
        {
            if (!_actionMap.Contains("faq/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("FAQ", (object)catchall);
        }

        public ActionResult GetDocs()
        {
            return View();
        }

        public ActionResult DemoPreview()
        {
            return View();
        }

        public ActionResult DocumentBuilderApi()
        {
            return View();
        }

        public ActionResult Drupal()
        {
            return View();
        }

        public ActionResult Editor()
        {
            return View();
        }

        public ActionResult EmbeddingForms()
        {
            return View();
        }

        public ActionResult Frameworks()
        {
            return View();
        }

        public ActionResult History()
        {
            return View();
        }

        public ActionResult HowItWorks()
        {
            return View();
        }

        public ActionResult HumHub()
        {
            return View();
        }

        public ActionResult InlineEditors()
        {
            return View();
        }

        public ActionResult InsertingExternalData()
        {
            return View();
        }

        public ActionResult InteractingOutside(string catchall)
        {
            if (!_actionMap.Contains("interactingoutside/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("InteractingOutside", (object)catchall);
        }

        public ActionResult Jira()
        {
            return View();
        }

        public ActionResult JavaSdk()
        {
            return View();
        }

        public ActionResult Liferay()
        {
            return View();
        }

        public ActionResult Mattermost()
        {
            return View();
        }

        public ActionResult Mentions()
        {
            return View();
        }

        public ActionResult Methods()
        {
            return View();
        }

        public ActionResult MobileIntegration()
        {
            return View();
        }

        public ActionResult Moodle()
        {
            return View();
        }

        public ActionResult Nextcloud()
        {
            return View();
        }

        public ActionResult Nuxeo()
        {
            return View();
        }

        public ActionResult Odoo()
        {
            return View();
        }

        public ActionResult Open()
        {
            return View();
        }

        public ActionResult OwnCloud()
        {
            return View();
        }

        public ActionResult Plone()
        {
            return View();
        }

        public ActionResult Plugins()
        {
            return View();
        }

        public ActionResult ProtectingRanges()
        {
            return View();
        }

        public ActionResult React()
        {
            return View();
        }

        public ActionResult Redmine()
        {
            return View();
        }

        public ActionResult Rename()
        {
            return View();
        }

        public ActionResult Review()
        {
            return View();
        }

        public ActionResult Save()
        {
            return View();
        }

        public ActionResult Security()
        {
            return View();
        }

        public ActionResult SettingAvatars()
        {
            return View();
        }

        public ActionResult SharePoint()
        {
            return View();
        }

        public ActionResult Signature(string catchall)
        {
            if (!_actionMap.Contains("signature/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("Signature", (object)catchall);
        }

        public ActionResult Strapi()
        {
            return View();
        }

        public ActionResult SuiteCRM()
        {
            return View();
        }

        public ActionResult Troubleshooting()
        {
            return View();
        }

        public ActionResult Try()
        {
            return View();
        }

        public ActionResult Viewing()
        {
            return View();
        }

        public ActionResult Vue()
        {
            return View();
        }

        public ActionResult WOPI(string catchall)
        {
            if (!_actionMap.Contains("wopi/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("WOPI", (object)catchall);
        }

        public ActionResult Wordpress()
        {
            return View();
        }
    }
}