<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shoes.aspx.cs" Inherits="WebBasic.Shoes" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All Shoes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <style>
        .modal {
            display: none; /* Hidden by default */

            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        .modal-backdrop {
            position: unset;
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
        }

        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }

        .table {
            text-align: center;
            font-size: larger;
            border-spacing: 15px;
        }

        .td {
            padding-top: 20px;
            border-bottom: 10px  ;

            margin:auto;
        }
    </style>



</head>
<body>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>


        <h1 style="text-align: center">All Shoes</h1>
        <br />


        <h4 style="text-align: center; margin-left: auto">
            <asp:Button ID="btnCreate" runat="server" OnClick="btnCreate_Click" Text="Create New Shoes" />
        </h4>
        <br />
        <br />

        <div style="place-content: center;margin-left: 25%" >
            <table>
                
                <tr>
                    <td>Name
                    </td>
                   
                    <td>
                        <asp:TextBox ID="txtSname" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Title
                    </td>
                    <td>
                        <asp:TextBox ID="txtStitle" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
              </tr>
               
                <tr>
                    <td></td>
                    <td style="padding-left:20px">
                        <asp:Button ID="btnClear" class="btn btn-secondary" runat="server" OnClick="btnClear_Click" Text="Clear" />
                    </td>
                    <td>
                        <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" OnClick="btnSearch_Click" Text="Search" />

                    </td>
                    
                </tr>

            </table>
        </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>


        <%--GridView fill data--%>
        <div>
            <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False"
                OnRowDeleting="GridView1_RowDeleting" DataKeyNames="Id" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="8">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name Shoes" />
                    <asp:BoundField DataField="Title" HeaderText="Title Shoes" />
                    <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="btn btn-danger" HeaderText="Remove data"></asp:CommandField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnUpdate" runat="server" CommandArgument='<%# Eval("ID") + "/" + Eval("Name") +"/" + Eval("Title")%>' OnClick="btnUpdate_Click">Update</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
        </div>

        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional"></asp:UpdatePanel>



        <%--Update Shoes--%>
        <div class="modal" id="divPopUp" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Update Shoes</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <label>Name</label>
                        <asp:HiddenField ID="IdShoes" runat="server" />
                        <asp:TextBox ID="txtName" CssClass=" form-control" placeholder="Name" runat="server"></asp:TextBox>

                        <label>Title</label>
                        <asp:TextBox ID="txtTitle" CssClass=" form-control" placeholder="Title" runat="server"></asp:TextBox>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnSave_Click" class="btn btn-primary" runat="server" OnClick="btnSave_Click_Click" Text="Save changes" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <%--Create Shoes--%>
        <div class="modal" id="divPopUp2" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Create New Shoes</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <label>Name</label>
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:TextBox ID="TextBox1" CssClass=" form-control" placeholder="Name" runat="server"></asp:TextBox>

                        <label>Title</label>
                        <asp:TextBox ID="TextBox2" CssClass=" form-control" placeholder="Title" runat="server"></asp:TextBox>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnCreate1" class="btn btn-primary" runat="server" OnClick="btnCreate1_Click1" Text="Save " />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>

        </div>

    </form>
</body>

</html>

