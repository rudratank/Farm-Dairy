<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Abouts.aspx.cs" Inherits="Rudra.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* Adjusted styles for better visibility */
        .about-header, .text-center.my-5 {
            color: #000; /* Set text color to black */
            text-shadow: none; /* Remove text shadow */
        }

        .about-content {
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
            padding: 30px;
            border-radius: 10px;
            margin-top: 30px;
        }

        .service-card {
            border: none;
            background-color: #fff; /* White background */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            transition: transform 0.3s ease;
        }

        .service-card:hover {
            transform: translateY(-10px);
        }

        .service-icon {
            font-size: 3rem;
            color: #ffc107;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
            margin-top: 10px;
        }

        .card-text {
            font-size: 1rem;
            color: #333;
        }

        .about-header h1 {
            font-size: 3rem;
            color: #ffc107;
        }

        .container.about-content {
            padding-top: 50px;
        }

        /* Style for the white card */
        .service-card .card-body {
            padding: 20px;
            border-radius: 10px;
        }
    </style>

    <!-- About Us Header -->
    <div class="about-header">
        <h1>About Us</h1>
    </div>

    <!-- About Us Content -->
    <div class="container about-content">
        <div class="row">
            <div class="col-lg-6 mb-4">
                <h2>Who We Are</h2>
                <p>Welcome to Kisan Khata, your reliable partner in managing agricultural activities. We aim to simplify farm management through modern tools and solutions, enabling farmers to increase productivity and manage their resources effectively.</p>
            </div>
            <div class="col-lg-6 mb-4">
                <img src="img/about-us.jpg" class="img-fluid rounded" alt="About Us">
            </div>
        </div>
    </div>

    <!-- Services Section -->
    <div class="container">
        <div class="text-center my-5 container about-content">
            <h2>Our Services</h2>
            <p>Explore the wide range of services we offer to help you manage your farm efficiently.</p>
        </div>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card service-card text-center">
                    <div class="card-body">
                        <i class="fas fa-tractor service-icon"></i>
                        <h5 class="card-title mt-3">Tractor Management</h5>
                        <p class="card-text">Track and manage all your tractors with ease using our comprehensive tools.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card service-card text-center">
                    <div class="card-body">
                        <i class="fas fa-cow service-icon"></i>
                        <h5 class="card-title mt-3">Livestock Management</h5>
                        <p class="card-text">Keep a detailed record of your livestock and ensure their well-being with our system.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card service-card text-center">
                    <div class="card-body">
                        <i class="fas fa-chart-line service-icon"></i>
                        <h5 class="card-title mt-3">Financial Reporting</h5>
                        <p class="card-text">Generate detailed financial reports to track your income and expenses.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
