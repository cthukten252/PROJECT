<%@ Page Title="Druk Trek" Language="C#" MasterPageFile="~/project.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PROJECT.Home" %>


<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Css/home.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   
    <section id="home" class="home-hero">
        <div class="home-hero-content">
            <p class="home-hero-sub">Welcome To Our Drukpa trek</p>
            <h1>YOU ARE GOING TO SEE</h1>
            <asp:HyperLink ID="lnkExplore" runat="server" NavigateUrl="~/Treks.aspx"
                           CssClass="home-btn" Text="JUST EXPLORE" />
        </div>
    </section>

</asp:Content>
