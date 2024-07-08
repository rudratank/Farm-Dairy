<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Rudra.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* Custom CSS for Registration Page */
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

    <!-- Header start -->
    <header class="py-3">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h2 class="display-4"><i class="fas fa-user-plus text-info"></i> New User Registration</h2>
                </div>
            </div>
        </div>
    </header>
    <!-- Header end -->

    <div class="container">
        <asp:Label ID="Label1" runat="server" CssClass="alert alert-success col-12" Visible="False">Registration Successful.</asp:Label>
    </div>

    <section class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg rounded">
                    <div class="card-body">
                        <div class="form-group mb-3">
                            <asp:Label ID="NameLabel" runat="server" AssociatedControlID="txtnm" CssClass="font-weight-bold">Name:</asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter name" ControlToValidate="txtnm" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <asp:TextBox ID="txtnm" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="txteml" CssClass="font-weight-bold">Email:</asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter email" ControlToValidate="txteml" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                </div>
                                <asp:TextBox ID="txteml" runat="server" CssClass="form-control" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <asp:Label ID="MobileLabel" runat="server" AssociatedControlID="txtmob" CssClass="font-weight-bold">Mobile Number:</asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter mobile number" ControlToValidate="txtmob" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-mobile-alt"></i></span>
                                </div>
                                <asp:TextBox ID="txtmob" runat="server" CssClass="form-control" placeholder="Enter your mobile number" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="txtpw" CssClass="font-weight-bold">Password:</asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter password" ControlToValidate="txtpw" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                </div>
                                <asp:TextBox ID="txtpw" runat="server" CssClass="form-control" placeholder="Enter your password" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group mb-3 text-center">
                           <asp:Button ID="btn" runat="server" CssClass="btn btn-primary btn-lg rounded-pill px-5" Text="Register" OnClick="btn_Click" />
                        </div>
                        <hr />
                        <div class="form-group text-center">
                            <asp:HyperLink ID="HyperLink1" CssClass="text-primary" runat="server" NavigateUrl="~/Login.aspx">Already have an account? Login here</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
