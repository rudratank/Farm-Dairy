<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Expenses.aspx.cs" Inherits="Rudra.Expenses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <asp:Label ID="Label1" runat="server" CssClass="alert alert-success text-center" Text="Income Added Successfully" Visible="False"></asp:Label>
                <div class="card shadow-lg rounded">
                    <div class="card-body">
                        <div class="row mt-2">
                            <div class="col">
                                <div class="mb-2">
                                    Date : <asp:TextBox ID="Txtdate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col">
                                <div class="mb-2">
                                    Select Type : 
                                    <asp:DropDownList ID="ddlcat" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlcat_SelectedIndexChanged">
                                        <asp:ListItem Value="">--Select--</asp:ListItem>
                                        <asp:ListItem>Tractor</asp:ListItem>
                                        <asp:ListItem>Livestock</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col">
                                <div class="mb-2">
                                    Select : 
                                    <asp:DropDownList ID="ddlbreed" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="">--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col">
                                <div class="mb-2">
                                    Select Transaction : 
                                    <asp:DropDownList ID="ddlgen" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col">
                                <div class="mb-2">
                                    Amount : 
                                    <asp:TextBox ID="txtamount" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mb-2 text-center">
                            <div class="row">
                                <div class="col">
                                    <asp:Button ID="Btnincome" runat="server" CssClass="btn btn-danger btn-lg" Text="Expenses" OnClick="Btnexpense_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mt-5 shadow-lg rounded">
                    <div class="card-body">
                        <h3 class="text-center mb-4 text-primary">Expanse Records</h3>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-responsive">
                            <Columns>
                                <asp:BoundField DataField="catagory" HeaderText="Category"  SortExpression="catagory" />
                                <asp:BoundField DataField="type" HeaderText="Type"  SortExpression="type" />
                                <asp:BoundField DataField="trans" HeaderText="Transaction"  SortExpression="trans" />
                                <asp:BoundField DataField="amount" HeaderText="Amount"  SortExpression="amount" />
                            </Columns>
                            <HeaderStyle CssClass="thead-light bg-primary text-white" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
