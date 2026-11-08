<%@ Page Title="Treks - Druk Trek" Language="C#" MasterPageFile="~/project.Master" AutoEventWireup="true" CodeBehind="Treks.aspx.cs" Inherits="PROJECT.Treks" %>
<%@ MasterType VirtualPath="~/project.Master" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Css/treks.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main class="treks-page">
        <div class="treks-wrap">

            <div class="treks-head">
                <h2 class="section-title">OUR TREKS</h2>
                <p class="section-sub">choose a trail and see where it takes you</p>
            </div>

            <div class="trek-grid">
                <asp:Repeater ID="rptTreks" runat="server">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" CssClass="trek-card"
                                       NavigateUrl='<%# Eval("Url") %>'>
                            <asp:Image runat="server" CssClass="trek-img"
                                       ImageUrl='<%# Eval("Image") %>'
                                       AlternateText='<%# Eval("Name") %>'
                                       onerror="this.style.display='none'" />
                            <span class="trek-glass">
                                <span class="trek-name"><%# Eval("Name") %></span>
                                <span class="trek-go" aria-hidden="true">
                                    <svg viewBox="0 0 24 24"><path d="M5 12h12M13 6l6 6-6 6" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/></svg>
                                </span>
                            </span>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </div>
    </main>

    <script>
        document.querySelectorAll('.trek-card').forEach(function (card) {
            var glass = card.querySelector('.trek-glass');
            card.addEventListener('pointermove', function (e) {
                var r = glass.getBoundingClientRect();
                glass.style.setProperty('--mx', (e.clientX - r.left) + 'px');
                glass.style.setProperty('--my', (e.clientY - r.top) + 'px');
            });
        });
    </script>
</asp:Content>

