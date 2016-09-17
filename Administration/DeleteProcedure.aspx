<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="DeleteProcedure.aspx.cs" Inherits="DeleteProcedure" %>

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
    <h1>Delete Procedure</h1>
    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
<table>
    <tr>
    <td class="auto-style2"><b>Select Procedure:</b></td>
    <td class="auto-style3"><b>Delete Selected Procedure:</b></td>
    </tr>
<tr>
    <td style="vertical-align:top;">        
<!-- grid view goes here -->
    <asp:GridView ID="GvProcedures" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dataSrcGvProcedures" AllowSorting="True" DataKeyNames="ProcID">
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
    <asp:SqlDataSource ID="dataSrcGvProcedures" runat="server" ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" 
        SelectCommand="SELECT ProcID, Categories.Name AS 'Category', 
                        Procedures.CreatedOn AS 'Created on:',
                        Procedures.Summary
                        FROM Procedures
                        LEFT JOIN Categories ON Procedures.CategoryID = Categories.CategoryID
                        ORDER By CreatedOn DESC;">

    </asp:SqlDataSource>
    </td>

    <td style="vertical-align:top;" class="auto-style1">
        <asp:DetailsView ID="DvProcedures" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="ProcID" DataSourceID="dataSrcDvProcedures" OnItemDeleted="DvProcedures_ItemDeleted">
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
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete Procedure" OnClientClick="return confirm('Are you sure you want to delete this procedure?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>    
    <br />
        
       
    <asp:SqlDataSource ID="dataSrcDvProcedures" runat="server" 
        ConnectionString="<%$ ConnectionStrings:kbelConnectionString %>" 
        SelectCommand="SELECT ProcID, Content
                        FROM Procedures
                        WHERE ProcID=@ProcID" 
        
        InsertCommand="DELETE FROM Procedures
                        WHERE ProcID = @original_ProcID" 

        OldValuesParameterFormatString="original_{0}" 
        DeleteCommand="DELETE FROM Procedures
                        WHERE ProcID = @original_ProcID" >

        <DeleteParameters>
            <asp:Parameter Name="original_ProcID" />
        </DeleteParameters>

        <InsertParameters>
            <asp:Parameter Name="original_ProcID" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvProcedures" Name="ProcID" PropertyName="SelectedValue" />
        </SelectParameters>

    </asp:SqlDataSource>
    
    </td>
</tr>
</table>
</asp:Content>

