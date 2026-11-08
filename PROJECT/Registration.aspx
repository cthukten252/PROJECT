<%@ Page Title="Registration - Druk Trek" Language="C#" MasterPageFile="~/project.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="PROJECT.Registration" %>
<%@ MasterType VirtualPath="~/project.Master" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link href="/Css/registration.css" rel="stylesheet" runat="server" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main class="reg-page">
        <div class="reg-card">

            <div class="reg-banner">
                <div class="reg-art">
                   
                    <asp:Image ID="imgHero" runat="server" ImageUrl="/image/snowman.png"
                               AlternateText="" CssClass="reg-hero-img" onerror="this.style.display='none'" />
                    <svg class="reg-trail" viewBox="0 0 220 120" aria-hidden="true">
                        <path d="M10 108 C40 70 40 30 80 30 C110 30 110 70 90 78 C120 90 170 85 200 55" fill="none" stroke="#fff" stroke-width="1.6" stroke-dasharray="5 6" stroke-linecap="round" />
                        <path d="M196 50l16-6-8 12z" fill="#fff" />
                    </svg>
                </div>
                <div class="reg-banner-text">
                    <h1>Trek Registration Form</h1>
                    <p>Please give us your contact information below and we will arrange your trek.</p>
                </div>
            </div>


            <asp:Panel ID="pnlForm" runat="server" CssClass="reg-form">

                <div class="reg-grid">
                    <div class="reg-field">
                        <asp:Label runat="server" AssociatedControlID="ddlTitle" CssClass="reg-label" Text="Title" />
                        <asp:DropDownList ID="ddlTitle" runat="server">
                            <asp:ListItem Value="" Text="Please Select" />
                            <asp:ListItem>Mr.</asp:ListItem>
                            <asp:ListItem>Ms.</asp:ListItem>
                            <asp:ListItem>Mrs.</asp:ListItem>
                            <asp:ListItem>Miss</asp:ListItem>
                            <asp:ListItem>Mx.</asp:ListItem>
                            <asp:ListItem>Dr.</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="reg-field">
                        <span class="reg-label">Contact name</span>
                        <div class="reg-two">
                            <div>
                                <asp:TextBox ID="txtFirst" runat="server" />
                                <small>First Name</small>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirst" ValidationGroup="reg"
                                    ErrorMessage="First name is required." CssClass="reg-error" Display="Dynamic" />
                            </div>
                            <div>
                                <asp:TextBox ID="txtLast" runat="server" />
                                <small>Last Name</small>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLast" ValidationGroup="reg"
                                    ErrorMessage="Last name is required." CssClass="reg-error" Display="Dynamic" />
                            </div>
                        </div>
                    </div>

                    <div class="reg-field">
                        <asp:Label runat="server" AssociatedControlID="txtBirth" CssClass="reg-label" Text="Birth date" />
                        <asp:TextBox ID="txtBirth" runat="server" TextMode="Date" />
                        <small>Date</small>
                    </div>

                    <div class="reg-field">
                        <asp:Label runat="server" AssociatedControlID="txtOrg" CssClass="reg-label" Text="Organization name" />
                        <asp:TextBox ID="txtOrg" runat="server" />
                    </div>

                    <div class="reg-field">
                        <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="reg-label" Text="E-mail" />
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="ex: myname@example.com" />
                        <small>example@example.com</small>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ValidationGroup="reg"
                            ErrorMessage="E-mail is required." CssClass="reg-error" Display="Dynamic" />
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" ValidationGroup="reg"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                            ErrorMessage="Enter a valid e-mail." CssClass="reg-error" Display="Dynamic" />
                    </div>

                    <div class="reg-field">
                        <asp:Label runat="server" AssociatedControlID="txtPhone" CssClass="reg-label" Text="Phone number" />
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" placeholder="+000 000 000 000" />
                    </div>
                </div>


                <h2 class="reg-bar">Travel Details</h2>

                <div class="reg-grid">
                    <div class="reg-field">
                        <asp:Label runat="server" AssociatedControlID="ddlFrom" CssClass="reg-label" Text="Departure country" />
                        <asp:DropDownList ID="ddlFrom" runat="server" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlFrom" InitialValue="" ValidationGroup="reg"
                            ErrorMessage="Please choose a country." CssClass="reg-error" Display="Dynamic" />
                    </div>

                    <div class="reg-field">
                        <asp:Label runat="server" AssociatedControlID="ddlTo" CssClass="reg-label" Text="Destination country" />
                        <asp:DropDownList ID="ddlTo" runat="server" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlTo" InitialValue="" ValidationGroup="reg"
                            ErrorMessage="Please choose a country." CssClass="reg-error" Display="Dynamic" />
                    </div>

                    <div class="reg-field reg-wide">
                        <asp:Label runat="server" AssociatedControlID="ddlTrek" CssClass="reg-label" Text="Trek options" />
                        <asp:DropDownList ID="ddlTrek" runat="server" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlTrek" InitialValue="" ValidationGroup="reg"
                            ErrorMessage="Please choose a trek." CssClass="reg-error" Display="Dynamic" />
                    </div>

                    <div class="reg-field">
                        <span class="reg-label">Departure date &amp; time</span>
                        <div class="reg-dt">
                            <asp:TextBox ID="txtDepDate" runat="server" TextMode="Date" />
                            <asp:TextBox ID="txtDepTime" runat="server" TextMode="Time" />
                        </div>
                    </div>

                    <div class="reg-field">
                        <span class="reg-label">Return date &amp; time</span>
                        <div class="reg-dt">
                            <asp:TextBox ID="txtRetDate" runat="server" TextMode="Date" />
                            <asp:TextBox ID="txtRetTime" runat="server" TextMode="Time" />
                        </div>
                    </div>

                    <div class="reg-field reg-wide">
                        <asp:Label runat="server" AssociatedControlID="ddlGuidance" CssClass="reg-label" Text="Guidance via" />
                        <asp:DropDownList ID="ddlGuidance" runat="server">
                            <asp:ListItem Value="" Text="Please Select" />
                            <asp:ListItem Value="Druk Trek" Text="Druk Trek" />
                            <asp:ListItem Value="Department of Tourism" Text="Department of Tourism" />
                        </asp:DropDownList>
                    </div>

                    <div class="reg-field reg-wide">
                        <span class="reg-label">Please check the services offered</span>
                        <asp:CheckBoxList ID="cblServices" runat="server" RepeatLayout="UnorderedList" CssClass="reg-services">
                            <asp:ListItem>Airline Tickets</asp:ListItem>
                            <asp:ListItem>Transportation</asp:ListItem>
                            <asp:ListItem>Trek Guide</asp:ListItem>
                            <asp:ListItem>Medical Assitance</asp:ListItem>
                            <asp:ListItem>Camp Materials</asp:ListItem>
                            <asp:ListItem>Hotel Accommodations</asp:ListItem>
                        </asp:CheckBoxList>
                    </div>
                </div>


                <h2 class="reg-bar">Traveler's Details</h2>

                <div class="reg-grid">
                    <div class="reg-field">
                        <asp:Label runat="server" AssociatedControlID="txtHotel" CssClass="reg-label" Text="Preferred hotel brand" />
                        <asp:TextBox ID="txtHotel" runat="server" />
                        <asp:DropDownList ID="ddlhotel"
                    </div>
                    <div class="reg-field">
                        <asp:Label runat="server" AssociatedControlID="txtAirline" CssClass="reg-label" Text="Preferred airline" />
                        <asp:TextBox ID="txtAirline" runat="server" />
                    </div>
                    <div class="reg-field reg-wide">
                        <asp:Label runat="server" AssociatedControlID="txtNotes" CssClass="reg-label" Text="Additional information" />
                        <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Rows="8" />
                    </div>
                </div>

                <div class="reg-footer">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Form" CssClass="reg-submit"
                                ValidationGroup="reg" OnClick="btnSubmit_Click" />
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlThanks" runat="server" Visible="false" CssClass="reg-thanks">
                <asp:Literal ID="litThanks" runat="server" />
            </asp:Panel>

        </div>
    </main>
</asp:Content>

