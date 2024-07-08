<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Rudra.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* Custom CSS for Login Page */
        body {
            background-image: url('img/background.jpg'); /* Replace 'img/background.jpg' with your image path */
            background-size: cover;
            background-position: center;
            color: white; /* Set text color to white */
        }

        .card {
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background for the card */
        }
    </style>

    <%-- Header start --%>
    <header class="py-3">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h2 class="display-4"><i class="fas fa-sign-in-alt text-info"></i> Login Here</h2>
                </div>
            </div>
        </div>
    </header>
    <%-- Header end --%>

    <div class="row">
        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
    </div>

    <section class="container" style="margin-bottom: 190px;">
        <div class="row">
            <div class="offset-1 col-10">
                <div class="card shadow-lg rounded">
                    <div class="card-body text-success">
                        <div class="form-group mb-2">
                            <div class="row">
                                <div class="offset-2 col-8">
                                    <label for="txtmob">Mobile No:</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Mobile Number" CssClass="text-danger" ControlToValidate="txtmob" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-mobile-alt"></i></span>
                                        </div>
                                        <asp:TextBox ID="txtmob" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mb-2">
                            <div class="row">
                                <div class="offset-2 col-8">
                                    <label for="txtpw">Password:</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Password" CssClass="text-danger" ControlToValidate="txtpw" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                        </div>
                                        <asp:TextBox ID="txtpw" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mb-2">
                            <div class="row">
                                 <div class="form-group mb-3 text-center">
                                     <asp:Button ID="btn" runat="server" CssClass="btn btn-primary btn-lg rounded-pill px-5" Text="Login" OnClick="btn_Click" />
                                 <hr />
                                    </div>
                                <asp:HyperLink ID="HyperLink1" CssClass="text-primary text-center" runat="server" NavigateUrl="~/Registration.aspx">If you are New User Click Here</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
