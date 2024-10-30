<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Builder framework samples</span>
</h1>
<p>Use the guides for <a href="<%= Url.Action("builderframeworksamples/cppbuildersamples") %>">C++</a> and <a href="<%= Url.Action("builderframeworksamples/csharpbuildersamples") %>">.Net</a> to run the samples.</p>

<ul class="sample-block">
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a>
            <div class="example-sample-img fill-spreadsheet"></div>
        </a>
        <div class="framework-sample-info">
            <p class="name-example-sample"><a>Filling spreadsheet</a></p>
            <p>Fills spreadsheet with array-based values.</p>
            <p class="block_more-sample">
                See: <a href="https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cpp/FillingSpreadsheet/FillingSpreadsheet/FillingSpreadsheet.cpp">C++</a> / 
                <a href="https://github.com/ONLYOFFICE/document-builder-samples/blob/master/csharp/FillingSpreadsheet/FillingSpreadsheet/Program.cs">.Net</a><br />
                <a href="<%= Url.Action("buildersamples/fillspreadsheet", "officeapi") %>">More</a>
            </p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a>
            <div class="example-sample-img comment-errors"></div>
        </a>
        <div class="framework-sample-info">
            <p class="name-example-sample"><a>Commenting spreadsheet errors</a></p>
            <p>Comments spreadsheet cells with formula errors.</p>
            <p class="block_more-sample">
                See: <a href="https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cpp/CommentingErrors/CommentingErrors/CommentingErrors.cpp">C++</a> / 
                <a href="https://github.com/ONLYOFFICE/document-builder-samples/blob/master/csharp/CommentingErrors/CommentingErrors/Program.cs">.Net</a><br />
                <a href="<%= Url.Action("buildersamples/commenterrors", "officeapi") %>">More</a>
            </p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a>
            <div class="example-sample-img create-presentation"></div>
        </a>
        <div class="framework-sample-info">
            <p class="name-example-sample"><a>Creating presentation</a></p>
            <p>Creates presentation with multiple slides, images and text.</p>
            <p class="block_more-sample">
                See: <a href="https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cpp/CreatingPresentation/CreatingPresentation/CreatingPresentation.cpp">C++</a> / 
                <a href="https://github.com/ONLYOFFICE/document-builder-samples/blob/master/csharp/CreatingPresentation/CreatingPresentation/Program.cs">.Net</a><br />
                <a href="<%= Url.Action("buildersamples/createpresentation", "officeapi") %>">More</a>
            </p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a>
            <div class="example-sample-img create-chart-presentation"></div>
        </a>
        <div class="framework-sample-info">
            <p class="name-example-sample"><a>Creating chart presentation</a></p>
            <p>Creates single-slide chart presentation.</p>
            <p class="block_more-sample">
                See: <a href="https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cpp/CreatingChartPresentation/CreatingChartPresentation/CreatingChartPresentation.cpp">C++</a> / 
                <a href="https://github.com/ONLYOFFICE/document-builder-samples/blob/master/csharp/CreatingChartPresentation/CreatingChartPresentation/Program.cs">.Net</a><br />
                <a href="<%= Url.Action("buildersamples/createchartpresentation", "officeapi") %>">More</a>
            </p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a>
            <div class="example-sample-img create-basic-form"></div>
        </a>
        <div class="framework-sample-info">
            <p class="name-example-sample"><a>Creating basic form</a></p>
            <p>Creates basic form with text and image inputs.</p>
            <p class="block_more-sample">
                See: <a href="https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cpp/CreatingBasicForm/CreateBasicForm/CreateBasicForm.cpp">C++</a> / 
                <a href="https://github.com/ONLYOFFICE/document-builder-samples/blob/master/csharp/CreatingBasicForm/CreatingBasicForm/Program.cs">.Net</a><br />
                <a href="<%= Url.Action("buildersamples/createbasicform", "officeapi") %>">More</a>
            </p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a>
            <div class="example-sample-img create-advanced-form"></div>
        </a>
        <div class="framework-sample-info">
            <p class="name-example-sample"><a>Creating advanced form</a></p>
            <p>Creates advanced form with table structure.</p>
            <p class="block_more-sample">
                See: <a href="https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cpp/CreatingAdvancedForm/CreateAdvancedForm/CreateAdvancedForm.cpp">C++</a> / 
                <a href="https://github.com/ONLYOFFICE/document-builder-samples/blob/master/csharp/CreatingAdvancedForm/CreatingAdvancedForm/Program.cs">.Net</a><br />
                <a href="<%= Url.Action("buildersamples/createadvancedform", "officeapi") %>">More</a>
            </p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a>
            <div class="example-sample-img fill-form"></div>
        </a>
        <div class="framework-sample-info">
            <p class="name-example-sample"><a>Filling form</a></p>
            <p>Fills form with text values and image.</p>
            <p class="block_more-sample">
                See: <a href="https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cpp/FillingForm/FillForm/FillForm.cpp">C++</a> / 
                <a href="https://github.com/ONLYOFFICE/document-builder-samples/blob/master/csharp/FillingForm/FillingForm/Program.cs">.Net</a><br />
                <a href="<%= Url.Action("buildersamples/fillform", "officeapi") %>">More</a>
            </p>
        </div>
    </li>
</ul>
