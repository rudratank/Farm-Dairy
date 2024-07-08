<%@ Page Title="Generate Report" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="incomereport1.aspx.cs" Inherits="Rudra.WebForm3" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="iTextSharp.text" %>
<%@ Import Namespace="iTextSharp.text.pdf" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="report">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="text-center">Generate Report</h2>
                <hr />
                <asp:DropDownList ID="ddlReportType" runat="server" CssClass="form-control mb-3">
                    <asp:ListItem Text="-- Select Report Type --" Value=""></asp:ListItem>
                    <asp:ListItem Text="Financial Report" Value="Financial"></asp:ListItem>
                    <asp:ListItem Text="Crop Yield Report" Value="CropYield"></asp:ListItem>
                    <asp:ListItem Text="Equipment Utilization Report" Value="EquipmentUtilization"></asp:ListItem>
                    <asp:ListItem Text="Supply Chain Report" Value="SupplyChain"></asp:ListItem>
                    <asp:ListItem Text="Weather and Environmental Report" Value="Weather"></asp:ListItem>
                </asp:DropDownList>
                <div class="card mt-5 shadow-lg rounded">
                    <div class="card-body">
                        <h3 class="text-center mb-4 text-primary">Income Records</h3>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-responsive">
                            <Columns>
                                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                                <asp:BoundField DataField="catagory" HeaderText="Category" SortExpression="catagory" />
                                <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                                <asp:BoundField DataField="trans" HeaderText="Transaction" SortExpression="trans" />
                                <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                            </Columns>
                            <HeaderStyle CssClass="thead-light bg-primary text-white" />
                        </asp:GridView>
                        <h4 class="text-center mt-4">Total Income: <asp:Label ID="lblTotalIncome" runat="server" CssClass="text-success"></asp:Label></h4>
                    </div>
                </div>
                <asp:Button ID="btnGenerateReport" CssClass="btn btn-primary btn-block mt-4" runat="server" Text="Generate Report" OnClick="btnGenerateReport_Click" />
            </div>
        </div>
    </div>
</asp:Content>
