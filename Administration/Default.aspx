<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Administration_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Administration</h1>
    <a href="ManageCategories.aspx">Manage Categories</a><br />
    <a href="ModerateProcedures.aspx">Moderate Procedures</a><br />
    <a href="ManagePolicies.aspx">Manage Policies</a><br />
    <a href="ManageEvents.aspx">Manage Events</a><br />
    <a href="DeleteProcedure.aspx">Delete Procedure</a><br />
    <a href="ManageConfig.aspx">Manage App Configuration</a><br />
</asp:Content>

