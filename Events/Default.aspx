<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Events and Procedures</h1>
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Events/CreateEditOrBrowseEvents.aspx">Create, Edit, or Browse Events</asp:HyperLink>
<br />
<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Events/CreateOrEditProcedure.aspx">Create or Edit Procedure</asp:HyperLink>
<br />
<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Events/FindProcedure.aspx">Find Procedure by Policy or Category</asp:HyperLink>
<br />
<asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Events/BrowsePolicies.aspx">Browse Policies</asp:HyperLink>
</asp:Content>

