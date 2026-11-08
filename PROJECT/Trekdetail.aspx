<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrekDetail.aspx.cs" Inherits="PROJECT.TrekDetail" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Trek - Druk Trek</title>
    <link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@600&family=Outfit:wght@300;400;500;600&family=Poppins:wght@400;500&family=Roboto:wght@400;700&display=swap" rel="stylesheet" />
    <link href="~/Css/trekdetial.css" rel="stylesheet" runat="server" />
</head>
<body>
    <form id="form1" runat="server">

       
        <asp:HyperLink ID="lnkClose" runat="server" ClientIDMode="Static" NavigateUrl="~/Treks.aspx"
                       CssClass="close-btn" ToolTip="Close">
            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M6 6l12 12M18 6L6 18" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round"/></svg>
            <span class="sr-only">Close</span>
        </asp:HyperLink>

        <asp:Panel ID="pnlMissing" runat="server" Visible="false" CssClass="td-soon">
            <div>
                <h1>Trek not found</h1>
                <p>No trek with the code &ldquo;<asp:Literal ID="litMissing" runat="server" />&rdquo; exists in TrekData.cs.<br />
                   The code in Treks.aspx.cs (Slug) and TrekData.cs must be spelled exactly the same.</p>
                <asp:HyperLink runat="server" NavigateUrl="~/Treks.aspx" CssClass="td-btn" Text="Back to all treks" />
            </div>
        </asp:Panel>


        <asp:Panel ID="pnlSoon" runat="server" Visible="false" CssClass="td-soon">
            <div>
                <h1><%: Trek.Name %></h1>
                <p>The full details for this trek are coming soon.</p>
                <asp:HyperLink runat="server" NavigateUrl="~/Treks.aspx" CssClass="td-btn" Text="Back to all treks" />
            </div>
        </asp:Panel>


        <asp:Panel ID="pnlDetails" runat="server">

            <section class="td-hero" style="background-image:url('<%= HeroImage %>')">

                <div class="td-panel">
                    <h1 class="td-name"><%: Trek.Name %></h1>
                    <p class="td-location">
                        <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 22s7-6.5 7-12a7 7 0 1 0-14 0c0 5.5 7 12 7 12z" fill="currentColor"/><circle cx="12" cy="10" r="2.6" fill="#4a5a6c"/></svg>
                        <%: Trek.Location %>
                    </p>

                    <div class="td-stats">
                        <div><span>Trek days</span><b><%: Trek.TrekDays %></b></div>
                        <div><span>Itinerary days</span><b><%: Trek.ItineraryDays %></b></div>
                        <div><span>Group size</span><b><%: Trek.GroupSize %></b></div>
                        <div><span>Difficulty</span><b><%: Trek.Difficulty %></b></div>
                        <div><span>Highest altitude</span><b><%: Trek.HighestAltitude %></b></div>
                        <div><span>Avg. walking distance</span><b><%: Trek.WalkDistance %></b></div>
                        <div><span>Avg. walking time</span><b><%: Trek.WalkTime %></b></div>
                        <div><span>Meals included</span><b><%: Trek.Meals %></b></div>
                    </div>

                    <p class="td-desc"><%: Trek.Description %></p>

                    <div class="td-price-row">
                        <div>
                            <span class="from">Starting from</span>
                            <span class="price"><%: Trek.Price %><small>/person</small></span>
                        </div>
                        <asp:HyperLink runat="server" NavigateUrl="~/Registration.aspx" CssClass="td-book" Text="Book a trip" />
                    </div>
                </div>

               
                <div class="td-art" aria-hidden="true">
                    <svg viewBox="0 0 1100 900" preserveAspectRatio="xMidYMid slice">
                        <path class="route" d="M560 -20 C560 120 470 110 440 230 C410 330 300 330 330 470 C350 570 250 610 280 730 C300 800 400 810 420 880" />
                        <circle cx="440" cy="230" r="9" /><circle cx="330" cy="470" r="9" />
                        <circle cx="280" cy="730" r="9" /><circle cx="420" cy="880" r="9" />
                        <circle cx="560" cy="40" r="9" />
                    </svg>
                </div>
            </section>

            <div class="td-container">

                <section class="td-join">
                    <div class="join-title">
                        <h2><%: Trek.JoinTitle %></h2>
                        <p class="join-date"><%: Trek.JoinDate %></p>
                    </div>
                    <p class="join-text"><%: Trek.JoinText %></p>
                    <div class="join-actions">
                        <asp:HyperLink runat="server" NavigateUrl="~/Contactus.aspx" CssClass="join-btn" Text="Get in touch" />
                        <a class="join-btn join-call" href="tel:<%: PhoneLink %>">
                            <svg viewBox="0 0 24 24" aria-hidden="true"><path fill="currentColor" d="M6.6 10.8c1.4 2.8 3.8 5.1 6.6 6.6l2.2-2.2c.3-.3.7-.4 1-.2 1.1.4 2.3.6 3.6.6.6 0 1 .4 1 1V20c0 .6-.4 1-1 1C10.6 21 3 13.4 3 4c0-.6.4-1 1-1h3.5c.6 0 1 .4 1 1 0 1.3.2 2.5.6 3.6.1.3 0 .7-.2 1l-2.3 2.2z"/></svg>
                            <span>or call us at <b><%: Trek.Phone %></b></span>
                        </a>
                    </div>
                </section>

                <section class="td-section">
                    <h2 class="td-title">About the Trek</h2>
                    <div class="td-cards">
                        <div class="td-card">
                            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M3 21h18M5 17l4-4 3 3 7-8M15 8h4v4"/></svg>
                            <h3>Highest altitude</h3>
                            <p><%: Trek.HighestAltitude %></p>
                        </div>
                        <div class="td-card">
                            <svg viewBox="0 0 24 24" aria-hidden="true"><circle cx="13" cy="4.5" r="1.8"/><path d="M11 21l2-6-2-3 1-4 3 3 3 1M9 21l1-5M7 14l2-4M18 10v11"/></svg>
                            <h3>Avg. walking distance</h3>
                            <p><%: Trek.WalkDistance %></p>
                        </div>
                        <div class="td-card">
                            <svg viewBox="0 0 24 24" aria-hidden="true"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3.5 2"/></svg>
                            <h3>Avg. walking time</h3>
                            <p><%: Trek.WalkTime %></p>
                        </div>
                        <div class="td-card">
                            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M6 3v7a2 2 0 0 0 2 2v9M4 3v5M8 3v5M18 3c-2.2 2-3 5-3 8h3v10"/></svg>
                            <h3>Meals on trek</h3>
                            <p><%: Trek.MealsLong %></p>
                        </div>
                    </div>

                    <asp:Panel ID="pnlIntro" runat="server" Visible="false" CssClass="td-intro">
                        <h3><%: Trek.IntroHeading %></h3>
                        <p><%: Trek.IntroText %></p>
                    </asp:Panel>

                    <asp:Panel ID="pnlGallery" runat="server" Visible="false" CssClass="td-gallery">
                        <asp:Image ID="imgGallery" runat="server" onerror="this.parentNode.style.display='none'" />
                    </asp:Panel>
                </section>

                <section class="td-section">
                    <h2 class="td-title">Trek Route</h2>
                    <div class="td-route">
                        <asp:Image runat="server" ID="imgRoute"
                                   AlternateText="Trek route map" onerror="this.style.display='none'" />
                    </div>
                </section>

                <section class="td-section">
                    <h2 class="td-title">Itinerary</h2>
                    <ul class="td-itinerary">
                        <asp:Repeater ID="rptItinerary" runat="server">
                            <ItemTemplate>
                                <li>
                                    <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 22s7-6.5 7-12a7 7 0 1 0-14 0c0 5.5 7 12 7 12z" fill="currentColor"/><circle cx="12" cy="10" r="2.6" fill="#fff"/></svg>
                                    <span><%#: Container.DataItem %></span>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </section>

                <section class="td-section td-info">
                    <asp:Repeater ID="rptSections" runat="server">
                        <ItemTemplate>
                            <h2><%#: Eval("Heading") %></h2>
                            <p><%#: Eval("Body") %></p>
                        </ItemTemplate>
                    </asp:Repeater>
                </section>

            </div>
        </asp:Panel>
    </form>

    <script>

        document.addEventListener('keydown', function (e) {
            if (e.key === 'Escape') document.getElementById('lnkClose').click();
        });
    </script>
</body>
</html>
