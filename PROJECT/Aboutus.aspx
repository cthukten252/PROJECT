<%@ Page Title="About us - Druk Trek" Language="C#" MasterPageFile="~/project.Master" AutoEventWireup="true" CodeBehind="Aboutus.aspx.cs" Inherits="PROJECT.Aboutus" %>
<%@ MasterType VirtualPath="~/project.Master" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="server">
    <link href="<%=ResolveUrl("/Css/aboutus.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main id="about" class="about-page">
        <div class="container">
            <div class="about-banner">
                <h2 class="section-title">ABOUT US</h2>
                <p class="section-sub">the people and the purpose behind every trek</p>
            </div>

            <div class="about-grid">
                <section class="about-card" id="mission">
                    <h3>Our Mission</h3>
                    <p>
                        At Druk Trek, our mission is to share the beauty of Bhutan through treks that are safe,
                        memorable and respectful of the land and its people. We plan routes for every kind of
                        traveller &ndash; first-time walkers, seasoned mountaineers, culture seekers and families &ndash;
                        and look after every detail so you can simply enjoy the journey and come home with
                        stories that last a lifetime.
                    </p>
                </section>

                <section class="about-card" id="vision">
                    <h3>Our Vision</h3>
                    <p>
                        We want to be a trusted name in Bhutanese trekking, known for honest service and a real
                        commitment to sustainable tourism. By pairing local knowledge with high standards of
                        safety and care, we hope to keep Bhutan's culture, mountains and communities thriving
                        for the travellers of tomorrow.
                    </p>
                </section>

                <section class="about-card full" id="team">
                    <h3>Our Team</h3>
                    <p>
                        Our team is the heart of Druk Trek. We are guides, cooks, drivers and planners united by
                        a love for the Himalayas and a promise to deliver outstanding experiences. From building
                        careful itineraries to making sure you stay safe and comfortable on the trail, we bring
                        together deep local knowledge and a friendly, professional approach.<br />
                        Our bilingual guides and trek leaders are warm communicators who build real connections
                        with our guests and make sure every detail of your trip is taken care of.
                    </p>
                </section>
            </div>
        </div>
    </main>
</asp:Content>
