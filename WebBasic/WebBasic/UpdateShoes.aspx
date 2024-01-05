<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateShoes.aspx.cs" Inherits="WebBasic.UpdateShoes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <div>
            Name<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </div>
        <div>
            Title
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" /> &emsp; <a href="Shoes.aspx">Back to All Shoes</a>
        </div>

       
    </form>
</body>
</html>
