<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeFile="ManageCategories.aspx.cs" Inherits="ManageCategories" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h1>Manage Categories</h1>

        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>

<table>
    <tr>
    <td><b>Select a Category:</b></td>
    <td><b>Edit, Delete, or Create Category:</b></td>
    </tr>
<tr>
    <td>        
<!-- grid view goes here -->
    <asp:GridView ID="GvCategories" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="CategoryID" DataSourceID="dataSrcGvCategories">
        <AlternatingRowStyle BackColor="#00CCFF" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>
        <SelectedRowStyle BackColor="#FFFF66" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="dataSrcGvCategories" runat="server" 
        ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" 
        SelectCommand="SELECT * FROM [Categories] ORDER BY [Name]"></asp:SqlDataSource>
    </td>

    <td style="vertical-align:top;">
    <asp:DetailsView ID="DvCategories" runat="server" Height="50px" Width="215px" AutoGenerateRows="False" DataKeyNames="CategoryID" DataSourceID="dataSrcDvCategories" OnItemDeleted="DvCategories_ItemDeleted" OnItemInserted="DvCategories_ItemInserted" OnItemUpdated="DvCategories_ItemUpdated">
        <Fields>
            <asp:TemplateField HeaderText="Category" SortExpression="Name">
                <EditItemTemplate>
                    <asp:RequiredFieldValidator ID="rfvCatName" runat="server" ErrorMessage="Name is required" Text="*" ControlToValidate="txtCatName" ValidationGroup="vgValidateCat" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtCatName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:RequiredFieldValidator ID="rfvCatName" runat="server" ErrorMessage="Name is required" Text="*" ControlToValidate="txtCatName" ValidationGroup="vgValidateCat" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtCatName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowEditButton="True" ShowInsertButton="True" ValidationGroup="vgValidateCat" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this event?');"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
        
    <br />
    <asp:SqlDataSource ID="dataSrcDvCategories" runat="server" ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" 
        DeleteCommand="DELETE FROM [Categories] 
        WHERE [CategoryID] = @original_CategoryID 
        AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL))"
        InsertCommand="INSERT INTO [Categories] ([Name]) VALUES (@Name)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [CategoryID], [Name] FROM [Categories] WHERE ([CategoryID] = @CategoryID)" 
        UpdateCommand="UPDATE [Categories] SET [Name] = @Name WHERE [CategoryID] = @original_CategoryID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_CategoryID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvCategories" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="original_CategoryID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </td>
    <td style="vertical-align:top;"> 
         <asp:ValidationSummary ID="vsInsertCatName" runat="server" ValidationGroup="vgValidateCat" ForeColor="Red" />
    </td>
</tr>
</table>
</asp:Content>
