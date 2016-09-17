<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="FindProcedure.aspx.cs" Inherits="FindProcedure" %>

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
    <h1>Find/View Procedures</h1>
    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
<table>
    <tr>
    <td class="auto-style2"><b>Find Procedure by Category or Policy:</b></td>
    </tr>
<tr>
    <td style="vertical-align:top;">        
<!-- grid view goes here -->
    <asp:GridView ID="GvUnapprovedProcedures" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dataSrcGvUnapprovedProcedures" AllowSorting="True" DataKeyNames="ProcID">
        <AlternatingRowStyle BackColor="#00CCFF" />

        <Columns>
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="Policy" HeaderText="Policy" SortExpression="Policy" />
            <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary" />
            <asp:BoundField DataField="Created on:" HeaderText="Created on:" SortExpression="Created on:" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>

        <SelectedRowStyle BackColor="#E4E46A" />

    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="dataSrcGvUnapprovedProcedures" runat="server" ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" SelectCommand="SELECT ProcID, Categories.Name AS 'Category', 
Procedures.CreatedOn AS 'Created on:',
Procedures.Summary,
Policies.Title AS 'Policy'
FROM Procedures
LEFT JOIN Categories ON Procedures.CategoryID = Categories.CategoryID
LEFT JOIN Policies ON Procedures.PolicyID = Policies.PolicyID
WHERE Approved = 'yes'
ORDER By Procedures.CreatedOn DESC;">

    </asp:SqlDataSource>
    </td>

    <td style="vertical-align:top;" class="auto-style1">
        <asp:DetailsView ID="DvUnapprovedProcedures" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="ProcID" DataSourceID="dataSrcDvUnapprovedProcedures">
            <Fields>
                <asp:TemplateField HeaderText="Procedure" SortExpression="Content">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtProcedureContent" runat="server" Rows="15" TextMode="MultiLine" Width="577px" Text='<%# Bind("Content") %>' BackColor="#86B7F7"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Content") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txtProcedureContent" runat="server" Rows="15" TextMode="MultiLine" Width="577px" Text='<%# Bind("Content") %>' BackColor="#86B7F7"></asp:TextBox>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
            </Fields>
            <HeaderStyle Font-Bold="True" />
        </asp:DetailsView>    
    <br />
        
       
    <asp:SqlDataSource ID="dataSrcDvUnapprovedProcedures" runat="server" 
        ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" 
        SelectCommand="SELECT ProcID, Content
        FROM Procedures
        WHERE ProcID=@ProcID" >
        <SelectParameters>
            <asp:ControlParameter ControlID="GvUnapprovedProcedures" Name="ProcID" PropertyName="SelectedValue" />
        </SelectParameters>

    </asp:SqlDataSource>
    
    </td>
</tr>
</table>
</asp:Content>

