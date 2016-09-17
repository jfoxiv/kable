<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="BrowsePolicies.aspx.cs" Inherits="BrowsePolicies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Browse Policies</h1>
    <table>
    <tr>
    <td class="auto-style2"><b>Select a Policy:</b></td>
    <td class="auto-style3"><b>View Policy:</b></td>
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
            <asp:BoundField DataField="CreatedBy" HeaderText="Created By" SortExpression="CreatedBy" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>

        <PagerSettings NextPageText="-&gt;" PreviousPageText="&lt;-" />

    </asp:GridView>
    <br />
        <asp:SqlDataSource ID="dataSrcGvPolicies" runat="server" ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" SelectCommand="SELECT [PolicyID], [Title], [CreatedBy], [CreatedOn] FROM [Policies]"></asp:SqlDataSource>
    </td>

    <td style="vertical-align:top;" class="auto-style1">
    <asp:DetailsView ID="DvPolicies" runat="server" Height="68px" Width="519px" AutoGenerateRows="False" DataSourceID="dataSrcDvPolicies" DataKeyNames="PolicyID">
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
        </Fields>
    
        <HeaderStyle Font-Bold="True" />
    
    </asp:DetailsView>
        
    <br />
    <asp:SqlDataSource ID="dataSrcDvPolicies" runat="server" ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT 
PolicyID, Title, Content, CreatedBy, CreatedOn
FROM Policies
WHERE PolicyID = @PolicyID">
        <SelectParameters>
            <asp:ControlParameter ControlID="GvPolicies" Name="PolicyID" PropertyName="SelectedValue" />
        </SelectParameters>
       
    </asp:SqlDataSource>
    </td>
    <td style="vertical-align:top;"> 
         &nbsp;</td>
</tr>
</table>
</asp:Content>

