<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MapCrudStoredProcedures.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .tblInsertStyle {
            width: 200px;
            background-color: #006699;
            color: white;
        }

        .auto-style2 {
            width: 125px;
        }

        input {
            color: rgb(206, 78, 46);
        }

        .fieldsetCss {
            background-color:rgb(245, 243, 243);
            width:500px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset class="fieldsetCss">
                <legend>All Products:</legend>

                <asp:GridView ID="grdAllProducts" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                <br />
                Insert New Product:<br />
                <table class="tblInsertStyle">
                    <tr>
                        <td class="auto-style2">ID:</td>
                        <td>
                            <asp:TextBox ID="txtNewProductId" runat="server" Style="margin-left: 0px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Name</td>
                        <td>
                            <asp:TextBox ID="txtNewProductName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Description</td>
                        <td>
                            <asp:TextBox ID="txtNewProductDescription" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Price</td>
                        <td>
                            <asp:TextBox ID="txtNewProductPrice" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Button ID="btnInsertNewProduct" runat="server" Text="Insert" Width="114px" OnClick="btnInsertNewProduct_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
                <fieldset>
                    <legend>Delete Product:</legend>
                    <asp:DropDownList ID="ddlProducts" runat="server">
                    </asp:DropDownList>
                    &nbsp;<asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Remove" Width="95px" />
                    <br />
                </fieldset>
                <fieldset>
                    <legend>Edit Product:</legend>
                    <asp:DropDownList ID="ddlEditProduct" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlEditProduct_SelectedIndexChanged">
                    </asp:DropDownList>
                    <br />
                    <asp:Panel ID="pnlEditProduct" runat="server" Visible="false">
                        <table class="tblInsertStyle">
                            <tr>
                                <td class="auto-style2">ID:</td>
                                <td>
                                    <asp:TextBox ID="txtUpdateProductId" runat="server" Style="margin-left: 0px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Name</td>
                                <td>
                                    <asp:TextBox ID="txtUpdateProductName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Description</td>
                                <td>
                                    <asp:TextBox ID="txtUpdateProductDescription" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Price</td>
                                <td>
                                    <asp:TextBox ID="txtUpdateProductPrice" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" Width="114px" OnClick="btnUpdate_Click" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </fieldset>
            </fieldset>
        </div>
    </form>
</body>
</html>
