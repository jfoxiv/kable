<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ManagePolicies.aspx.cs" Inherits="ManagePolicies" %>

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
    <h1>Manage Policies</h1>
      <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
<table>
    <tr>
    <td class="auto-style2"><b>Select a Policy:</b></td>
    <td class="auto-style3"><b>Delete, Edit, or Create a Policy:</b></td>
    </tr>
<tr>
    <td style="vertical-align:top;">        
<!-- grid view goes here -->
    <asp:GridView ID="GvPolicies" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dataSrcGvPolicies" DataKeyNames="PolicyID" AllowSorting="True">
        <AlternatingRowStyle BackColor="#00CCFF" />
        <SelectedRowStyle BackColor="#FFFF66" />
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="CreatedOn" HeaderText="Created On" SortExpression="CreatedOn" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>

        <PagerSettings NextPageText="-&gt;" PreviousPageText="&lt;-" />

    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="dataSrcGvPolicies" runat="server" ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" 
        SelectCommand="SELECT PolicyID, Title, CreatedOn
FROM Policies
ORDER BY PolicyID
" DeleteCommand="DELETE FROM Policies
WHERE
PolicyID = @PolicyID;" InsertCommand="INSERT INTO Policies
(CategoryID, Title, Content, CreatedBy, CreatedOn)
VALUES
(@CategoryID, @Title, @Content, @CreatedBy, GETDATE();" UpdateCommand="UPDATE Policies SET 
Content = @Content
WHERE PolicyID = @PolicyID;">
        <DeleteParameters>
            <asp:Parameter Name="PolicyID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CategoryID" />
            <asp:Parameter Name="Title" />
            <asp:Parameter Name="Content" />
            <asp:Parameter Name="CreatedBy" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Content" />
            <asp:Parameter Name="PolicyID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </td>

    <td style="vertical-align:top;" class="auto-style1">
    <asp:DetailsView ID="DvPolicies" runat="server" Height="68px" Width="519px" AutoGenerateRows="False" DataSourceID="dataSrcDvPolicies" DataKeyNames="PolicyID" OnItemDeleted="dvBtnDelete" OnItemInserted="dvBtnAddPolicy" OnItemInserting="dvBtnSetPolicyCreator" OnItemUpdated="DvPolicies_ItemUpdated">
        <Fields>
            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                <EditItemTemplate>
                    <asp:RequiredFieldValidator ID="dvVerifyPolicyTitleRFV" runat="server" ControlToValidate="dvTxtPolicyTitle" ErrorMessage="Title is required" ForeColor="Red" ValidationGroup="vgDvAddOrEditPolicy">*</asp:RequiredFieldValidator>
                    <br>
                    </br>
                    <asp:TextBox ID="dvTxtPolicyTitle" runat="server" Text='<%# Bind("Title") %>' Width="586px"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:RequiredFieldValidator ID="dvVerifyPolicyTitleRFV" runat="server" ControlToValidate="dvTxtPolicyTitle" ErrorMessage="Title is required" ForeColor="Red" ValidationGroup="vgDvAddOrEditPolicy">*</asp:RequiredFieldValidator>
                    <br/> 
                    <asp:TextBox ID="dvTxtPolicyTitle" runat="server" Height="16px" Text='<%# Bind("Title") %>' ValidationGroup="vgDvAddOrEditPolicy" Width="586px"></asp:TextBox>
                 </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Policy" SortExpression="Content">
                <EditItemTemplate>
                    <asp:RequiredFieldValidator ID="dvVerifyPolicyContentRFV" runat="server" ControlToValidate="dvTxtPolicyContent" ErrorMessage="Content is required" ForeColor="Red" ValidationGroup="vgDvAddOrEditPolicy">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="dvTxtPolicyContent" runat="server" Rows="15" Text='<%# Bind("Content") %>' TextMode="MultiLine" Width="586px"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:RequiredFieldValidator ID="dvVerifyPolicyContentRFV" runat="server" ControlToValidate="dvTxtPolicyContent" ErrorMessage="Content is required" ForeColor="Red" ValidationGroup="vgDvAddOrEditPolicy">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="dvTxtPolicyContent" runat="server" Rows="15" Text='<%# Bind("Content") %>' TextMode="MultiLine" Width="586px"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="dvTxtPolicyContent" runat="server" Rows="15" Text='<%# Bind("Content") %>' TextMode="MultiLine" Width="586px" BackColor="#86B7F7"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Created By" SortExpression="CreatedBy">
                <EditItemTemplate>
                    <asp:Label ID="Label5" runat="server" Font-Italic="True" Text=""></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="Label5" runat="server" Font-Italic="True" Text=""></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("CreatedBy") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Created On" SortExpression="CreatedOn">
                <EditItemTemplate>
                    <asp:Label ID="Label6" runat="server" Font-Italic="True" Text=""></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="Label6" runat="server" Font-Italic="True" Text=""></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("CreatedOn") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowEditButton="True" ShowInsertButton="True" ValidationGroup="vgDvAddOrEditPolicy" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this event?');"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    
        <HeaderStyle Font-Bold="True" />
    
    </asp:DetailsView>
        
    <br />
      
    <asp:SqlDataSource ID="dataSrcDvPolicies" runat="server" ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT 
PolicyID, Title, Content, CreatedBy, CreatedOn
FROM Policies
WHERE PolicyID = @PolicyID" 
        DeleteCommand="DELETE FROM Policies WHERE PolicyID = @original_PolicyID" 
        InsertCommand="INSERT INTO POLICIES
                        (Title, Content, CreatedBy, CreatedOn)
                        VALUES
                        (@Title, @Content, @CreatedBy, GETDATE())" 
        UpdateCommand="UPDATE Policies SET
                        Title = @Title,
                        Content = @Content
                        WHERE
                        PolicyID = @original_PolicyID
                        ">
        <DeleteParameters>
            <asp:Parameter Name="original_PolicyID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" />
            <asp:Parameter Name="Content" />
            <asp:Parameter Name="CreatedBy" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvPolicies" Name="PolicyID" PropertyName="SelectedValue" />
        </SelectParameters>
       
        <UpdateParameters>
            <asp:Parameter Name="Title" />
            <asp:Parameter Name="Content" />
            <asp:Parameter Name="original_PolicyID" />
        </UpdateParameters>
       
    </asp:SqlDataSource>
    </td>
    <td style="vertical-align:top;"> 
         <asp:ValidationSummary ID="vsAddOrEditPolicy" runat="server" ValidationGroup="vgDvAddOrEditPolicy" ForeColor="Red" />
    </td>
</tr>
</table>
</asp:Content>

