<%@ Page Title="Add Income" Language="C#" MasterPageFile="~/Site2.Master" EnableViewState="true" EnableEventValidation="true" AutoEventWireup="true" CodeBehind="income1.aspx.cs" Inherits="Rudra.Transaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <asp:Label ID="Label1" runat="server" CssClass="alert alert-success text-center" Text="Income Added Successfully" Visible="False"></asp:Label>
                <div class="card shadow-lg rounded">
                    <div class="card-body">
                        <h3 class="card-title text-center mb-4 text-primary">Add Income</h3>
                        <form>
                            <div class="form-group">
                                <label for="Txtdate">Date:</label>
                                <asp:TextBox ID="Txtdate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group mt-3">
                                <label for="ddlcat">Select Type:</label>
                                <asp:DropDownList ID="ddlcat" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlcat_SelectedIndexChanged">
                                    <asp:ListItem Value="">--Select--</asp:ListItem>
                                    <asp:ListItem>Tractor</asp:ListItem>
                                    <asp:ListItem>Livestock</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group mt-3">
                                <label for="ddlbreed">Select:</label>
                                <asp:DropDownList ID="ddlbreed" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="">--Select--</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group mt-3">
                                <label for="ddlgen">Select Transaction:</label>
                                <asp:DropDownList ID="ddlgen" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group mt-3">
                                <label for="txtamount">Amount:</label>
                                <asp:TextBox ID="txtamount" runat="server" CssClass="form-control" placeholder="Enter amount"></asp:TextBox>
                            </div>
                            <div class="form-group text-center mt-4">
                                <asp:Button ID="Btnincome" runat="server" CssClass="btn btn-primary btn-lg" Text="Add Income" OnClick="Btnincome_Click" />
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card mt-5 shadow-lg rounded">
                    <div class="card-body">
                        <h3 class="text-center mb-4 text-primary">Income Records</h3>
                        <asp:GridView ID="GridView1" runat="server"  CssClass="table table-hover table-responsive" CellPadding="0" ForeColor="#212529" GridLines="None" CellSpacing="0"></asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
