<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Templates.aspx.cs" Inherits="Templates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Templates</h1>


    <h2>Policy</h2>
    Title: &lt;e.g. "Always Keep Systems Backed Up"&gt;
    <br />
    Intent: &lt;e.g. "Minimize chances of data loss when disaster strikes"&gt;
    <br />
    Applicability: &lt;e.g. "All Student Administrators"&gt;
    <p />
    &lt;Policy Content&gt;
    <p />
    <h3>Example:</h3>
    Title: All Servers Should Be Backed Up Regularly<br />
    Intent: Minimize chances of data loss when disaster strikes<br />
    Applicability: All Student SIMMLAB Administrators
    <p />
    Computers are complex machines, and like any machines, are prone to mechanical failure. It is therefore vital
    their data is backed up regularly. Full backups should be performed weekly, and incremental backups performed
    nightly.

    <h2>Procedure</h2>
    
    Procedure: &lt;title, e.g. "Chronos Backup Configuration"&gt;
    <br/>
    In keeping with policy "&lt;title of relevant policy&gt," &lt;general introduction to the topic&gt;
    <br/>
    Instructions: How to &lt;task name, e.g. "Configure Chronos"&gt;
    <p/>
    &lt;instructions in either list or paragraph form&gt;
    <p/>
    <h3>Example:</h3>
    Procedure: Chronos Backup Configuration
    <p/>
    In keeping with policy "All Servers Should Be Backed Up Regularly", whenever a new server is added to the lab, it should be added to the Chronos configuration on the master backup server.
    <p/>
    Instructions: How to add a new host to the Chronos backup configuration.

    <p/>
    1) Log onto new server as Administrator.
    <br/>
    2) Open Windows Explorer and navigate to drive Z:
    <br/>
    3) Open the "Utilities" folder.
    <br/>
    4) Open the "Backup" folder.
    <br/>
    5) Double-click the icon for "InstallCClient." This starts the installation wizard.
    <br/>
    6) Step through the installation process. There is no need to change any of the defaults, so simply click "Next" at each stage of the process. At the last stage, click "OK".
    <br/>
    7) Activate the "Start" menu
    <br/>
    8) Click "All Programs"
    <br/>
    9) Find the "Chronos Backup" folder in the menu, and click it.
    <br/>
    10) Click the "Start Chronos Client" item.
    <br/>
    11) Log off the new server.
    <br/>
    12) Log on to Chronos master server ("chronos")
    <br/>
    13) Activate the "Start" menu
    <br/>
    14) Click "All Programs"
    <br/>
    15) Find the "Chronos Backup" folder in the menu, and click it.
    <br/>
    16) Click the "Chronos" menu item.
    <br/>
    17) Click "Clients" tab in Chronos interface.
    <br/>
    18) Click "New Client" button to bring up a list of machines.
    <br/>
    19) Click the name of the new machine.
    <br/>
    20) Click the "OK" button.
    <br/>
    21) Log off the Chronos master server.
</asp:Content>

