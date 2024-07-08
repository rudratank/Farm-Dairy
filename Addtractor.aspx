<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Addtractor.aspx.cs" Inherits="Rudra.Addtractor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <asp:Label ID="Label1" runat="server" CssClass="alert alert-success text-center" Text="Tractor Added Successfully" Visible="False"></asp:Label>
                <div class="card shadow-lg rounded">
                    <div class="card-body">
                        <h3 class="card-title text-center mb-4 text-primary">Add Tractor</h3>
                        <div class="form-group">
                            <label for="txtnm">Name:</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Name" CssClass="text-danger" ControlToValidate="txtnm" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtnm" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group mt-3">
                            <label for="ddlbrand">Brand:</label>
                            <asp:DropDownList ID="ddlbrand" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlbrand_SelectedIndexChanged">
                                <asp:ListItem>Sonalika</asp:ListItem>
                                <asp:ListItem>Mahindra</asp:ListItem>
                                <asp:ListItem>Swaraj</asp:ListItem>
                                <asp:ListItem>John Deere</asp:ListItem>
                                <asp:ListItem>Escorts</asp:ListItem>
                                <asp:ListItem>New Holland</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group mt-3">
                            <label for="ddlmodel">Model:</label>
                            <asp:DropDownList ID="ddlmodel" runat="server" CssClass="form-control">
                                <asp:ListItem>--SELECT--</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group text-center mt-4">
                            <asp:Button ID="btn" runat="server" CssClass="btn btn-primary btn-lg" Text="ADD TRACTOR" OnClick="btn_Click" />
                        </div>
                    </div>
                </div>
                <div class="card mt-5 shadow-lg rounded">
                    <div class="card-body">
                        <h3 class="text-center mb-4 text-primary">Tractor Records</h3>
                        <asp:GridView ID="GridView1" runat="server" class="table table-hover" CellPadding="0" ForeColor="#212529" GridLines="None" CellSpacing="0" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                             <AlternatingRowStyle BackColor="#F8F9FA" />
                            <Columns>
                                <asp:CommandField HeaderText="Select" ShowSelectButton="True" />
                            </Columns>
                            <EditRowStyle BackColor="#28A745" />
                            <FooterStyle BackColor="#007BFF" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#007BFF" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#6C757D" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" />
                            <SelectedRowStyle BackColor="#17A2B8" Font-Bold="True" ForeColor="White" />                   
                            <SortedAscendingCellStyle BackColor="#E9ECEF" />
                            <SortedAscendingHeaderStyle BackColor="#007BFF" />
                            <SortedDescendingCellStyle BackColor="#DEE2E6" />
                            <SortedDescendingHeaderStyle BackColor="#007BFF" />
                    </asp:GridView>
                        <asp:Button ID="btnDel" runat="server" Text="Delete" Visible="false" OnClick="btnDel_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
