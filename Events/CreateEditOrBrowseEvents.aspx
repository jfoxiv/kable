<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CreateEditOrBrowseEvents.aspx.cs" Inherits="CreateEditOrBrowseEvents" %>

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
    <h1>View, Edit, or Create Event</h1>
        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
       
<table>
    <tr>
    <td class="auto-style2"><b>Select an Event:</b></td>
    <td class="auto-style3"><b>View, Edit, or Create Event:</b></td>
    </tr>
<tr>
    <td style="vertical-align:top;">        
<!-- grid view goes here -->
    <asp:GridView ID="GvEvents" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dataSrcGvEvents" DataKeyNames="EventID" AllowSorting="True">
        <AlternatingRowStyle BackColor="#00CCFF" />

        <Columns>
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary" />
            <asp:BoundField DataField="CreatedOn" HeaderText="CreatedOn" SortExpression="CreatedOn" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>

        <PagerSettings NextPageText="-&gt;" PreviousPageText="&lt;-" />

        <SelectedRowStyle BackColor="#E4E46A" />

    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="dataSrcGvEvents" runat="server" ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" 
        SelectCommand="SELECT EventID, Categories.Name AS 'Category', Summary, CreatedOn
                        FROM Events
                        JOIN Categories ON Events.CategoryID = Categories.CategoryID
                        ORDER BY CreatedOn ASC;">
    </asp:SqlDataSource>
    </td>

    <td style="vertical-align:top;" class="auto-style1">
    <asp:DetailsView ID="DvEvents" runat="server" Height="68px" Width="519px" AutoGenerateRows="False" DataSourceID="dataSrcDvEvents" DataKeyNames="EventID" OnItemInserted="dvBtnAddEvent" OnItemInserting="dvBtnSetEventCreator" OnItemUpdated="DvEvents_ItemUpdated">
        <FieldHeaderStyle Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="Summary" SortExpression="Summary">
                <EditItemTemplate>
                    <asp:RequiredFieldValidator ID="rfvEventSummary" runat="server" ErrorMessage="Summary is required" Text="*" ValidationGroup="vgValidateEvent" ControlToValidate="txtEventSummary" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtEventSummary" runat="server" Text='<%# Bind("Summary") %>' Width="586px"></asp:TextBox>
                    <br />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:RequiredFieldValidator ID="rfvEventSummary" runat="server" ErrorMessage="Summary is required" Text="*" ValidationGroup="vgValidateEvent" ControlToValidate="txtEventSummary" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtEventSummary" runat="server" Text='<%# Bind("Summary") %>' Width="586px"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Summary") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Event" SortExpression="Content">
                <EditItemTemplate>
                    <asp:RequiredFieldValidator ID="rfvEventContent" runat="server" ErrorMessage="Content is required" Text="*" ValidationGroup="vgValidateEvent" ControlToValidate="txtEventContent" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtEventContent" runat="server" Rows="15" TextMode="MultiLine" Text='<%# Bind("Content") %>' Width ="586px"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:RequiredFieldValidator ID="rfvEventContent" runat="server" ErrorMessage="Content is required" Text="*" ValidationGroup="vgValidateEvent" ControlToValidate="txtEventContent" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtEventContent" runat="server" Text='<%# Bind("Content") %>' Height="290px" Rows="15" TextMode="MultiLine" Width="590px"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="txtContent" runat="server" Text='<%# Bind("Content") %>' Height="290px" Rows="15" TextMode="MultiLine" Width="590px" BackColor="#86B7F7"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Category" SortExpression="Category">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlEventCategories" runat="server" 
                        DataSourceID="sqlDdlCategories" DataTextField="Name" 
                        DataValueField="CategoryID" Width="586px"
                        SelectedValue ='<%# Bind("CategoryID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlEventCategories" runat="server" 
                        DataSourceID="sqlDdlCategories" DataTextField="Name" 
                        DataValueField="CategoryID" AppendDataBoundItems="true"
                        SelectedValue ='<%# Bind("CategoryID") %>' 
                        Height="28px" Width="589px">
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Creator" SortExpression="Creator">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Creator") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="dvEventsLblCreator" runat="server" Text="This value will be set automatically." Font-Italic="True"></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Creator") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date" SortExpression="Date">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="dvEventsLblCreatedOn" runat="server" Text="This value will be set automatically." Font-Italic="True"></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowEditButton="True" ShowInsertButton="True" ValidationGroup="vgValidateEvent">
            </asp:CommandField>
    </Fields>
    
    </asp:DetailsView>
        
    <br />
       
    <asp:SqlDataSource ID="dataSrcDvEvents" runat="server" ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT EventID, Categories.CategoryID, 
                        Categories.Name AS 'Category', Summary, Content, 
                        CreatedBy as 'Creator', CreatedOn as 'Date'
                        FROM Events
                        JOIN Categories ON Events.CategoryID = Categories.CategoryID
                        WHERE EventID = @EventID" 
        DeleteCommand="DELETE FROM Events WHERE EventID = @original_EventID" 
        InsertCommand="INSERT INTO EVENTS
                        (CategoryID, Summary, Content, CreatedBy, CreatedOn)
                        VALUES
                        (@CategoryID, @Summary, @Content, @CreatedBy, GETDATE());" 
        UpdateCommand="UPDATE Events SET
                        CategoryID = @CategoryID,
                        Summary = @Summary,
                        Content = @Content
                        WHERE EventID = @original_EventID">
        <DeleteParameters>
            <asp:Parameter Name="original_EventID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:FormParameter Name="CategoryID" FormField="sqlDdlCategories" />
            <asp:Parameter Name="Summary" />
            <asp:Parameter Name="Content" />
            <asp:Parameter Name="CreatedBy" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvEvents" Name="EventID" PropertyName="SelectedValue" />
        </SelectParameters>
       
        <UpdateParameters>
            <asp:Parameter Name="CategoryID" />
            <asp:Parameter Name="Summary" />
            <asp:Parameter Name="Content" />
            <asp:Parameter Name="original_EventID" />
        </UpdateParameters>
       
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDdlCategories" runat="server" 
        SelectCommand="SELECT CategoryID, Name FROM Categories WHERE Name &lt;&gt; 'Default';" 
        ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>"></asp:SqlDataSource>
    </td>
    <td style="vertical-align:top;"> 
         <asp:ValidationSummary ID="vsValidateEvent" runat="server" ValidationGroup="vgValidateEvent" ForeColor="Red" />
    </td>

</tr>
</table>
</asp:Content>


