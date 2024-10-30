<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl"
%>

<div class="try-new-block">
    <a id="tryNew" class="button active" style="padding: 10px 20px;">TRY NEW VERSION</a>
    <div class="try-new-popup">
        <p class="header"><b>Try now New API </b><span class="beta-label">BETA</span></p>
        <p>Try out the new view and capabilities of the API documentation</p>
        <a id="startTryNew" class="button active" style="padding: 10px 20px;">START</a>
    </div>
    <script type="text/javascript">
        $("#tryNew,#startTryNew").click(
            function () {
                var d = new Date();
                d.setTime(d.getTime() + (30 * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toUTCString();
                document.cookie = "X-OO-API=1;" + expires + ";path=/";
                window.location.href = window.location.href.match(/https?\:\/\/[\w\.\:]+/)[0];
            }
        );

        $("#tryNew").hover(
            function () {
                $(".try-new-popup").show();
                $(".try-new-popup").addClass("visible");
            },
            function () {
                $(".try-new-popup").removeClass("visible")
            }
        );
    </script>
</div>
