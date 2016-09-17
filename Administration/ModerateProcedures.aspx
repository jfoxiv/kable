<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ModerateProcedures.aspx.cs" Inherits="ModerateProcedures" %>

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
    <h1>Moderate Procedures</h1>
    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
<table>
    <tr>
    <td class="auto-style2"><b>Select an Unapproved Procedure:</b></td>
    <td class="auto-style3"><b>Approve Selected Procedure:</b></td>
    </tr>
<tr>
    <td style="vertical-align:top;">        
<!-- grid view goes here -->
    <asp:GridView ID="GvUnapprovedProcedures" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dataSrcGvUnapprovedProcedures" AllowSorting="True" DataKeyNames="ProcID">
        <AlternatingRowStyle BackColor="#00CCFF" />

        <Columns>
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary" />
            <asp:BoundField DataField="Created on:" HeaderText="Created on:" SortExpression="Created on:" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>

        <SelectedRowStyle BackColor="#E4E46A" />

    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="dataSrcGvUnapprovedProcedures" runat="server" ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" SelectCommand="SELECT ProcID, Categories.Name AS 'Category', 
Procedures.CreatedOn AS 'Created on:',
Procedures.Summary
FROM Procedures
LEFT JOIN Categories ON Procedures.CategoryID = Categories.CategoryID
WHERE Approved = 'no'
ORDER By CreatedOn DESC;">

    </asp:SqlDataSource>
    </td>

    <td style="vertical-align:top;" class="auto-style1">
        <asp:DetailsView ID="DvUnapprovedProcedures" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="ProcID" DataSourceID="dataSrcDvUnapprovedProcedures" OnItemUpdated="DvUnapprovedProcedures_ItemUpdated">
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
                <asp:CommandField ButtonType="Button" EditText="Approve" ShowEditButton="True" UpdateText="Confirm Approval" />
            </Fields>
        </asp:DetailsView>    
    <br />
        
       
    <asp:SqlDataSource ID="dataSrcDvUnapprovedProcedures" runat="server" 
        ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" 
        SelectCommand="SELECT ProcID, Content
        FROM Procedures
        WHERE ProcID=@ProcID" UpdateCommand="UPDATE Procedures 
        SET Approved='yes'
        WHERE ProcID=@ProcID" >
        <SelectParameters>
            <asp:ControlParameter ControlID="GvUnapprovedProcedures" Name="ProcID" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProcID" />
        </UpdateParameters>

    </asp:SqlDataSource>
    
    </td>
</tr>
</table>
</asp:Content>

