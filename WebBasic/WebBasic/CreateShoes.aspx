<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateShoes.aspx.cs" Inherits="WebBasic.CreateShoes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <h1>Create Shoes</h1>

        <div>
            <asp:Label ID="Label1" runat="server" Text="Name: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <p>&nbsp;</p>

        <div>
            <asp:Label ID="Label2" runat="server" Text="Title: "></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </div>

        <p>&nbsp;</p>

        <div>
            <asp:Button ID="Button1" runat="server" Text="Insert" OnClick="Button1_Click" /> &emsp; <a href="Shoes.aspx">Back to All Shoes</a>
        </div>

    </form>
</body>
</html>
