<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Rudra.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* Hero Section Styles */
        .hero-section {
            background-image: url('img/banner1.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #fff;
            font-size: 2rem;
        }

        .hero-section h1 {
            font-size: 3.5rem;
            margin-bottom: 20px;
        }

        .hero-section p {
            font-size: 1.5rem;
            margin-bottom: 30px;
        }

        /* Features Section Styles */
        .features-section {
            padding: 80px 0;
            background-color: #f8f9fa;
        }

        .feature-item {
            text-align: center;
            margin-bottom: 30px;
            padding: 30px;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .feature-item i {
            font-size: 3rem;
            color: #ffc107;
            margin-bottom: 20px;
        }

        .feature-item h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .feature-item p {
            font-size: 1.1rem;
            color: #333;
        }
    </style>

    <!-- Hero Section -->
    <section class="hero-section">
        <div>
            <h1>Welcome to Kisan Khata</h1>
            <p>Your reliable partner in managing agricultural activities.</p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registration.aspx" CssClass="btn btn-primary btn-lg">Get Started</asp:HyperLink>
        </div>
    </section>
    <section class="features-section">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="feature-item">
                        <i class="fas fa-tractor"></i>
                        <h3>Tractor Management</h3>
                        <p>Track and manage all your tractors with ease using our comprehensive tools.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-item">
                        <i class="fas fa-cow"></i>
                        <h3>Livestock Management</h3>
                        <p>Keep a detailed record of your livestock and ensure their well-being with our system.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-item">
                        <i class="fas fa-chart-line"></i>
                        <h3>Financial Reporting</h3>
                        <p>Generate detailed financial reports to track your income and expenses.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
