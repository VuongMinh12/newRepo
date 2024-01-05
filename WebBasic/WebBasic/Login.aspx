<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebBasic.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <fieldset style="width: 30%; margin-left: 40%">
                <legend style="font-weight: bold; border: double">Login Form</legend>
                <table style="align-content: center">
                    <tr>
                        <td>
                            <b>User Name</b>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rftxtUserName" runat="server" ControlToValidate="txtUserName"
                                ErrorMessage="Please enter user name." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>
                            <b>Password</b>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rftxtPassword" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="Please enter password." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Button ID="btnLogin" runat="server" Text="Log In" OnClick="btnLogin_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>

            </fieldset>

        </div>
    </form>
</body>
</html>
