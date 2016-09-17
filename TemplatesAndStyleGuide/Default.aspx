<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="TemplatesAndStyleGuide_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Templates and Style Guide</h1>

    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/TemplatesAndStyleGuide/Templates.aspx">Procedure and Policy Templates</asp:HyperLink>
    <br />
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/TemplatesAndStyleGuide/StyleGuide.aspx">Style Guide for Procedure Write-Ups</asp:HyperLink>

</asp:Content>

