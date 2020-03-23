﻿<%@ Page
    Title=""
    Language="C#"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<!DOCTYPE html>
<html style="height: 100%;">
<head>
    <title>ONLYOFFICE Api Documentation</title>
</head>
<body style="height: 100%; margin: 0;">

    <div id="placeholder" style="height: 100%"></div>
    <script type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>

    <script type="text/javascript">
        <% switch (Request["method"])
           { %>

        <% case "docxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme)
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "xlsxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme)
                            },
                        DocumentType = "spreadsheet",
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "pptxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme)
                            },
                        DocumentType = "presentation",
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "doc",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.doc",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.doc"
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme)
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "xlsEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xls",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Spreadsheet Title.xls",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xls"
                            },
                        DocumentType = "spreadsheet",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme)
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "pptEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "ppt",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Presentation Title.ppt",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.ppt"
                            },
                        DocumentType = "presentation",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme)
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "odtEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "odt",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.odt",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.odt"
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme)
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "odsEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "ods",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Spreadsheet Title.ods",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.ods"
                            },
                        DocumentType = "spreadsheet",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme)
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "odpEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "odp",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Presentation Title.odp",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.odp"
                            },
                        DocumentType = "presentation",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme)
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "txtEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "txt",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.txt",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.txt"
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme)
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "csvEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "csv",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Spreadsheet Title.csv",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.csv"
                            },
                        DocumentType = "spreadsheet",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme)
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "pdfViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pdf",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.pdf",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pdf"
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Mode = "view"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docxViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Mode = "view"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "xlsxViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        DocumentType = "spreadsheet",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Mode = "view"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "pptxViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        DocumentType = "presentation",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Mode = "view"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docxCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Request["key"],
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "xlsxCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Request["key"],
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        DocumentType = "spreadsheet",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "pptxCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Request["key"],
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        DocumentType = "presentation",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docxStrictCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Request["key"],
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Autosave = false
                                    },
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "xlsxStrictCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Request["key"],
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        DocumentType = "spreadsheet",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Autosave = false
                                    },
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "pptxStrictCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Request["key"],
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        DocumentType = "presentation",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Autosave = false
                                    },
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "rebrandingDocxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Customer = new Config.EditorConfigConfiguration.CustomizationConfig.CustomerConfig
                                            {
                                                Address = "My City, 123a-45",
                                                Info = "Some additional information",
                                                Logo = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo-big.png"), Query = ""}.ToString(),
                                                Mail = "john@example.com",
                                                Name = "John Smith and Co.",
                                                Www = "example.com"
                                            },
                                        Logo = new Config.EditorConfigConfiguration.CustomizationConfig.LogoConfig
                                            {
                                                Image = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo.png"), Query = ""}.ToString(),
                                                Url = "https://example.com"
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "rebrandingXlsxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        DocumentType = "spreadsheet",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Customer = new Config.EditorConfigConfiguration.CustomizationConfig.CustomerConfig
                                            {
                                                Address = "My City, 123a-45",
                                                Info = "Some additional information",
                                                Logo = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo-big.png"), Query = ""}.ToString(),
                                                Mail = "john@example.com",
                                                Name = "John Smith and Co.",
                                                Www = "example.com"
                                            },
                                        Logo = new Config.EditorConfigConfiguration.CustomizationConfig.LogoConfig
                                            {
                                                Image = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo.png"), Query = ""}.ToString(),
                                                Url = "https://example.com"
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "rebrandingPptxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        DocumentType = "presentation",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Customer = new Config.EditorConfigConfiguration.CustomizationConfig.CustomerConfig
                                            {
                                                Address = "My City, 123a-45",
                                                Info = "Some additional information",
                                                Logo = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo-big.png"), Query = ""}.ToString(),
                                                Mail = "john@example.com",
                                                Name = "John Smith and Co.",
                                                Www = "example.com"
                                            },
                                        Logo = new Config.EditorConfigConfiguration.CustomizationConfig.LogoConfig
                                            {
                                                Image = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo.png"), Query = ""}.ToString(),
                                                Url = "https://example.com"
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docxReview": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Edit = false,
                                        Review = true
                                    }
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "fillForms": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo-form.docx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Edit = false,
                                        FillForms = true
                                    }
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docxComment": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Comment = true,
                                        Edit = false
                                    }
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "xlsxComment": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Comment = true,
                                        Edit = false
                                    }
                            },
                        DocumentType = "spreadsheet",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "pptxComment": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Comment = true,
                                        Edit = false
                                    }
                            },
                        DocumentType = "presentation",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "modifyFilter": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Request["key"],
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo-filter.xlsx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        ModifyFilter = false
                                    }
                            },
                        DocumentType = "spreadsheet",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "modifyContentControl": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo-form.docx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Edit = true,
                                        ModifyContentControl = false
                                    }
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% } %>
    </script>
</body>
</html>
