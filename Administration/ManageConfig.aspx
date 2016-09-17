<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ManageConfig.aspx.cs" Inherits="ManageConfig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 614px;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            width: 614px;
            height: 23px;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Manage Configuration</h1>
        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
       
<table>
    <tr>
    <td class="auto-style2"><b>Select a Parameter:</b></td>
    <td class="auto-style3"><b>Edit Parameter Value:</b></td>
    </tr>
<tr>
    <td style="vertical-align:top;">        
<!-- grid view goes here -->
    <asp:GridView ID="GvConfig" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ParamID" DataSourceID="dataSrcGvConfig">
        <AlternatingRowStyle BackColor="#00CCFF" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
            <asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>
        <PagerSettings NextPageText="-&gt;" PreviousPageText="&lt;-" />

        <SelectedRowStyle BackColor="#E4E46A" />

    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="dataSrcGvConfig" runat="server" ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" 
            SelectCommand="SELECT ParamID, Name, Value
                           FROM Config">
    </asp:SqlDataSource>
    </td>

    <td style="vertical-align:top;" class="auto-style1">
    <asp:DetailsView ID="DvConfig" runat="server" Height="68px" Width="519px" AutoGenerateRows="False" DataSourceID="dataSrcDvConfig" DataKeyNames="ParamID" OnItemUpdated="DvConfig_ItemUpdated">
        <Fields>
            <asp:BoundField DataField="Name" HeaderText="Parameter" ReadOnly="True" SortExpression="Name" >
            <HeaderStyle Font-Bold="True" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Value" SortExpression="Value">
                <EditItemTemplate>
                    <asp:TextBox ID="txtParameterValue" runat="server" Text='<%# Bind("Value") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvParameterValue" runat="server" ControlToValidate="txtParameterValue" ErrorMessage="Value is required." ForeColor="Red" ValidationGroup="vgEditConfig">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Value") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Value") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowEditButton="True" ValidationGroup="vgEditConfig" />
        </Fields>
    
    </asp:DetailsView>
        
    <br />
       
    <asp:SqlDataSource ID="dataSrcDvConfig" runat="server" ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" 
        SelectCommand="SELECT ParamID, Name, Value
        FROM Config
        WHERE ParamID = @ParamID" 
        
        UpdateCommand="UPDATE Config
        SET Value = @Value
        WHERE
        ParamID = @ParamID">
        <SelectParameters>
            <asp:ControlParameter ControlID="GvConfig" Name="ParamID" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Value" />
            <asp:Parameter Name="ParamID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </td>
    <td style="vertical-align:top;"> 
         <asp:ValidationSummary ID="vsEditConfig" runat="server" ValidationGroup="vgEditConfig" ForeColor="Red" />
    </td>
</tr>
</table>
</asp:Content>

