<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="Rudra.blog" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="agileits_breadcrumbs">
		<div class="container">
			<a href="blog.aspx" class="btn btn-outline-success  my-4">Income</a>
			<a href="ExpenseReport.aspx" class="btn btn-outline-danger active my-4 ">Expense</a>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
               
            </asp:ScriptManager>
      

		</div>
	</div>
</asp:Content>
