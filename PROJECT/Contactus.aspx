<%@Page Title ="Contact Us - Druk Trek" Language="C#" MasterPageFile="/project.Master" AutoEventWireup="true" CodeBehind="/Contactus.aspx.cs" Inherits="PROJECT.Contactus" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="server">
    <link href="<%=ResolveUrl("/Css/contact.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main class="contact-page">
        <Section class="contact-hero">
            <div class="contact-hero-left">
                <span class="hero-left"><i class="dot"></i> PLan your Trip</span>

                <h1>Contact Us</h1>
            </div>
            <p class="hero-right">
                Start by telling us when and where you would like to go, and we will help bring it to life.
            </p>
        </Section>

        <div class="contact-body">
            <div class="contact-warp contact-grid">

                <asp:Panel ID="pnlForm" runat="server" CssClass="form-card">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtName" Text="Name" />
                        <asp:TextBox ID="txtName" runat="server" placeholder="Your full name" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" ValidationGroup="contact" ErrorMessage="Please enter your name." CssClass="error" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtEmail" Text="Email" />
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Placeholder="you@example.com" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ValidationGroup="contact" ErrorMessage="Please enter your email." CssClass="error" Display="Dynamic" />

                        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" ValidationGroup="contact" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ErrorMessage="Please enter a valid email." CssClass="error" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtMessage" Text="Message" />
                        <asp:TextBox ID="txtMessage" runat="server" Rows="9" PLaceholder="Your message here" />
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtMessage" ValidationGroup="contact" ErrorMessage="PLease Write a message." CssClass="error" Display="Dynamic" />
                    </div>

                    <asp:Button ID="btnsend" runat="server" Text="Send Message" CssClass="btn-send" ValidationGroup="contact" OnClick="btnSend_Click" />
                </asp:Panel>

                <asp:Panel ID="pnlThanks" runat="server" Visible="false" CssClass="form-card thanks-card">
                    <asp:Literal ID="litThanks" runat="server" />
                </asp:Panel>

                <div class="photo-card">
                    <asp:Image ID="imgSide" runat="server" ImageUrl="/image/Bhutan.jpg" AlternativeText="Bhutan LAndScape"/>
                </div>
            </div>

            <div class="contact-wrap info-row">

                    <div class="info-item">
                        <div class="info-icon">
                            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M6.6 10.8c1.4 2.8 3.8 5.1 6.6 6.6l2.2-2.2c.3-.3.7-.4 1-.2 1.1.4 2.3.6 3.6.6.6 0 1 .4 1 1V20c0 .6-.4 1-1 1C10.6 21 3 13.4 3 4c0-.6.4-1 1-1h3.5c.6 0 1 .4 1 1 0 1.3.2 2.5.6 3.6.1.3 0 .7-.2 1l-2.3 2.2z"/></svg>
                        </div>
                        <h3>Call&amp; WhatsApp</h3>
                        <p>+975 77 689 071 <br /> +975 77 222 448</p>
                    </div>

                    <div class="info-item">
                        <div class="info-icon">
                            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 2a10 10 0 1 0 0 20 10 10 0 0 0 0-20zm0 2a8 8 0 1 1 0 16 8 8 0 0 1 0-16zm-1 3v6l4.5 2.7.8-1.3-3.8-2.3V7z"/></svg>
                        </div>

                        <h3>Working Hours</h3>
                        <p>Daily: 9am &ndash; 5pm(GMT +6)<br />Sunday: Closed</p>
                    </div>

                    <div class="info=item">
                        <div class="info-icon">
                             <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M3 5h18a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1zm1 2v.5l8 5.3 8-5.3V7H4zm16 10V10l-8 5.3L4 10v7h16z"/></svg>
                        </div>

                        <h3> Write to US</h3>
                        <p>zenxkage108@gmail.com</p>
                    </div>
                </div>

        </div>
    </main>
</asp:Content>
