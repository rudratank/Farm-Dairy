<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="Rudra.WebForm1" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Header start --%>
    <style>
        .backimage{
            background-image:url(img/banner1.jpg);
        }
    </style>
    <header class="py-3">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h2><i class="fas fa-sign-out-alt text-info"></i>Logout</h2>
                </div>
            </div>
        </div>
    </header>
    <%-- Header end --%>

    <section class="container" style="margin-bottom:190px">
        <div class="row">
            <div class="offset-1 col-10">
                <div class="card">
                    <div class="card-body text-success text-center">
                        <h3>You have been logged out successfully.</h3>
                        <p class="mt-4">
                            <asp:HyperLink ID="HyperLink1" CssClass="btn btn-outline-primary" runat="server" NavigateUrl="~/Login.aspx">Login Again</asp:HyperLink>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>


</asp:Content>

