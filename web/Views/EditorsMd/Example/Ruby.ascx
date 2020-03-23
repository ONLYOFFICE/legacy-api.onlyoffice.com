<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">How to integrate online editors into your own web site on Ruby</span>
</h1>

<h2>Introduction</h2>
<p class="dscr">
    To integrate <b>ONLYOFFICE online editors</b> into your own website on <b>Ruby</b> you need to download and install ONLYOFFICE editors on your local server and use the <a href="<%= Url.Action("demopreview") %>">Ruby Example</a> for their integration.
    We will show how to run the Ruby example on Linux OS.
</p>

<div class="note">
    The integration examples are used to demonstrate document editors functions and the ways to connect <b>Document Server</b> to your own application.
    <b>DO NOT USE</b> these examples on your own server without <b>PROPER CODE MODIFICATIONS</b>!
</div>

<p>This guide will show you the sequence of actions to integrate the editors successfully.</p>

<h2 id="linux-1" class="copy-link"><span class="style_step">Step 1. </span>Download and Install Document Server</h2>
<p>First, download the <a href="<%= Url.Action("demopreview") %>"><b>ONLYOFFICE Editors</b></a> (the ONLYOFFICE Document Server).</p>
<p>See the detailed guide to learn how to install Document Server <a href="https://helpcenter.onlyoffice.com/server/developer-edition/windows/index.aspx?from=api_ruby_example">for Windows</a>, <a href="https://helpcenter.onlyoffice.com/server/developer-edition/linux/index.aspx?from=api_ruby_example">for Linux</a>, or <a href="https://helpcenter.onlyoffice.com/server/developer-edition/docker/docker-installation.aspx?from=api_ruby_example">for Docker</a>.</p>

<h2 id="linux-2" class="copy-link"><span class="style_step">Step 2. </span>Install the prerequisites and run the web site with the editors</h2>
<ol>
    <li>Install <b>Ruby Version Manager (RVM)</b> and the latest stable <b>Ruby</b> version:
        <div class="commandline">gpg --keyserver "hkp://keys.gnupg.net" --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3</div>
        <div class="commandline">\curl -sSL https://get.rvm.io | bash -s stable --ruby</div>
    </li>
    <li>Download the archive with the Ruby example and unpack the archive:
        <div class="commandline">wget "https://api.onlyoffice.com/app_data/editor/Ruby%20Example.zip"</div>
        <div class="commandline">unzip Ruby\ Example.zip</div>
    </li>
    <li>Change the current directory for the project directory:
        <div class="commandline">cd Ruby\ Example</div>
    </li>
    <li>Install the dependencies:
        <div class="commandline">bundle install</div>
    </li>
    <li>Edit the <em>application.rb</em> configuration file.
        Specify the name of your local server with the ONLYOFFICE Document Server installed.
        <div class="commandline">nano config/application.rb</div>
        <p>Edit the following lines:</p>

        <pre>
Rails.configuration.urlConverter="https://documentserver/ConvertService.ashx"
Rails.configuration.urlApi="https://documentserver/web-apps/apps/api/documents/api.js"
Rails.configuration.urlPreloader="https://documentserver/web-apps/apps/api/documents/cache-scripts.html"
</pre>

        <p>Where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>
    </li>
    <li>Run the <b>Rails</b> application:
        <div class="commandline">rails s -b 0.0.0.0 -p 80</div>
    </li>
    <li>See the result in your browser using the address:
        <div class="commandline">http://localhost</div>
        <p>If you want to experiment with the editor configuration, modify the <a href="<%= Url.Action("advanced") %>">parameters</a> it the <em>views\home\editor.html.erb</em> file.</p>
    </li>
</ol>

<h2 id="linux-3" class="copy-link"><span class="style_step">Step 3. </span>Checking accessibility</h2>
<p>
    In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of <b>documentserver</b> in the configuration files.
    And you must also make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of <b>example.com</b> in the configuration files.
</p>

<p>If you integrated the editors successfully the result should look like the <a href="<%= Url.Action("demopreview") %>#DemoPreview">demo preview</a> on our site.</p>
