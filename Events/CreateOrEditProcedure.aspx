<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CreateOrEditProcedure.aspx.cs" Inherits="CreateOrEditProcedure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 614px;
        }
        .auto-style2 {
            height: 23px;
        }
        </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Create or Edit Procedure</h1>
    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
<table>
    <tr>
    <td class="auto-style2"><b>Select Procedure:</b></td>
    <td class="auto-style2"><b>Edit or Create Procedure:</b></td>
    </tr>
<tr>
    <td style="vertical-align:top;">        
<!-- grid view goes here -->
    <asp:GridView ID="GvProcedures" runat="server" AllowPaging="True" AutoGenerateColumns="False" AllowSorting="True" DataKeyNames="ProcID" DataSourceID="dataSrcGvEvents" >
        <AlternatingRowStyle BackColor="#00CCFF" />
        
        <Columns>
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="Policy" HeaderText="Policy" SortExpression="Policy" />
            <asp:BoundField DataField="Summary" HeaderText="Procedure" SortExpression="Summary" />
            <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
        </Columns>
        
        <SelectedRowStyle BackColor="#E4E46A" />
        
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="dataSrcGvEvents" runat="server" ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" 
    SelectCommand="SELECT ProcID, Categories.Name AS 'Category', 
	Policies.Title AS 'Policy', 
	Procedures.Summary
    FROM Procedures
    JOIN Categories ON Procedures.CategoryID = Categories.CategoryID
    JOIN Policies on Procedures.PolicyID = Policies.PolicyID
    ORDER BY Category;">
    
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="dataGetAdminEmail" runat="server" ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" SelectCommand="SELECT Value FROM Config WHERE Name='adminEmail'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dataGetSmtpServer" runat="server" ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" SelectCommand="SELECT Value FROM Config WHERE Name='smtpServer'"></asp:SqlDataSource>
    </td>

    <td style="vertical-align:top;" class="auto-style1">
        <asp:DetailsView ID="DvProcedures" runat="server" Height="50px" Width="586px" 
            AutoGenerateRows="False" DataKeyNames="ProcID" DataSourceID="dataDvProcedures" 
            OnItemUpdated="DvProcedures_ItemUpdated" OnItemInserted="DvProcedures_ItemInserted" OnItemInserting="DvProcedures_ItemInserting">
            <Fields>
                <asp:TemplateField HeaderText="Procedure" SortExpression="Summary">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="fvProcedureSummary" runat="server" ErrorMessage="Summary is required" ControlToValidate="txtProcedureSummary" ValidationGroup="vgValidateProcedureData" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="txtProcedureSummary" runat="server" Text='<%# Bind("Summary") %>' Width="586px" CausesValidation="True"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:RequiredFieldValidator ID="fvProcedureSummary" runat="server" ErrorMessage="Summary is required" ControlToValidate="txtProcedureSummary" ValidationGroup="vgValidateProcedureData" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="txtProcedureSummary" runat="server" Text='<%# Bind("Summary") %>' Width="586px" CausesValidation="True"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Summary") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Instructions" SortExpression="Procedure">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="fvProcedureContentRequired" runat="server" 
                            ErrorMessage="Procedure text is required." ValidationGroup="vgValidateProcedureData" 
                            Text="*" ControlToValidate="txtProcedureContent" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="txtProcedureContent" runat="server" Rows="15" Text='<%# Bind("Procedure") %>' TextMode="MultiLine" ValidationGroup="vgValidateProcedureData" Width="586px" CausesValidation="True"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:RequiredFieldValidator ID="fvProcedureContentRequired" runat="server" 
                            ErrorMessage="Procedure text is required." ValidationGroup="vgValidateProcedureData" 
                            Text="*" ControlToValidate="txtProcedureContent" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="txtProcedureContent" runat="server" Rows="15" Text='<%# Bind("Procedure") %>' TextMode="MultiLine" ValidationGroup="vgValidateProcedureData" Width="586px" CausesValidation="True"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txtProcedureContent" Text='<%# Bind("Procedure") %>' runat="server" BackColor="#86B7F7" Rows="15" TextMode="MultiLine" Width="586px"></asp:TextBox>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category" SortExpression="Category">
                    <EditItemTemplate>                        
                        <asp:DropDownList ID="ddlCategories" runat="server" DataSourceID="dataDdlCategories" 
                            DataTextField="Category" DataValueField="CategoryID" Width="586px"
                            SelectedValue='<%# Bind("CategoryID") %>' >
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlCategories" runat="server" DataSourceID="dataDdlCategories" 
                            DataTextField="Category" DataValueField="CategoryID" Width="586px"
                            SelectedValue='<%# Bind("CategoryID") %>' >
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Policy" SortExpression="Policy">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlPolicies" runat="server" DataSourceID="dataDdlPolicies" 
                            DataTextField="Policy" DataValueField="PolicyID" 
                            SelectedValue='<%# Bind("PolicyID") %>'
                            Width="586px"></asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlPolicies" runat="server" DataSourceID="dataDdlPolicies" 
                            DataTextField="Policy" DataValueField="PolicyID" 
                            SelectedValue='<%# Bind("PolicyID") %>'
                            Width="586px">
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Policy") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Created On" SortExpression="Created On">
                    <EditItemTemplate>
                        <!-- this field is never updated -->
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <!-- this field is populated by the code-behind page --> 
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Created On]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Created by" SortExpression="Created by">
                    <EditItemTemplate>
                        <!-- this field is never updated -->
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <!-- this field is handled by the data source update command -->
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Created by]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" ShowInsertButton="True" ButtonType="Button" ValidationGroup="vgValidateProcedureData" />
            </Fields>
        </asp:DetailsView>
    
        <asp:SqlDataSource ID="dataDvProcedures" runat="server" ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" 
            DeleteCommand="DELETE FROM [Procedures] WHERE [ProcID] = @ProcID"
             
            InsertCommand="INSERT INTO [Procedures] 
            ([PolicyID], [CategoryID], [Summary], [Content], [CreatedBy], [CreatedOn]) 
            VALUES (@PolicyID, @CategoryID, @Summary, @Procedure, @CreatedBy, GETDATE())" 

            SelectCommand="SELECT 
            ProcID,
            Categories.CategoryID,
            Categories.Name AS 'Category', 
            Policies.PolicyID,
            Policies.Title AS 'Policy', 
            Procedures.Summary,
            Procedures.Content AS 'Procedure', 
            Procedures.CreatedOn AS 'Created On', 
            Procedures.CreatedBy AS 'Created by'
            FROM Procedures
            JOIN Categories ON Procedures.CategoryID = Categories.CategoryID
            JOIN Policies on Procedures.PolicyID = Policies.PolicyID
            WHERE ProcID = @ProcID
            ORDER BY Category;" 

            UpdateCommand="UPDATE [Procedures] SET 
            [PolicyID] = @PolicyID, 
            [CategoryID] = @CategoryID, [Summary] = @Summary, 
            [Content] = @Procedure,
            [Approved] = 'no'
            WHERE [ProcID] = @ProcID">

            <DeleteParameters>
                <asp:Parameter Name="ProcID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PolicyID" Type="Int32" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="Summary" Type="String" />
                <asp:Parameter Name="Procedure" Type="String" />
                <asp:Parameter Name="CreatedBy" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GvProcedures" Name="ProcID" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="PolicyID" Type="Int32" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="Summary" Type="String" />
                <asp:Parameter Name="Procedure" Type="String" />
                <asp:Parameter Name="ProcID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dataDdlCategories" runat="server" ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" 
        SelectCommand="SELECT 
        CategoryID,
        Name AS 'Category'
        FROM Categories
        WHERE NAME &lt;&gt; 'Default'
        ORDER BY Name">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dataDdlPolicies" runat="server" ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" 
            SelectCommand="SELECT
	            PolicyID,
	            Title AS 'Policy'
            FROM Policies
            WHERE Title &lt;&gt; 'Default'"></asp:SqlDataSource>
    </td>
    <!-- need another <td> here, for validation grid -->
    <td style="vertical-align:top;"> 
         <asp:ValidationSummary ID="vsCreateOrEditProcedure" runat="server" ValidationGroup="vgValidateProcedureData" ForeColor="Red" />
    </td>
</tr>
</table>
    

    </asp:Content>

