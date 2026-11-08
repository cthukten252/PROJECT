using System;
using System.Web;
using System.Web.UI;

namespace PROJECT
{
    public partial class TrekDetail : Page
    {
        protected TrekInfo Trek;
        protected string HeroImage;
        protected string RouteImage;
        protected string PhoneLink;

        protected void Page_Load(object sender, EventArgs e)
        {
            string slug = (Request.QueryString["trek"] ?? "").Trim().ToLowerInvariant();
            Trek = TrekData.Get(slug);

            if (Trek == null)
            {
                pnlDetails.Visible = false;
                pnlMissing.Visible = true;
                litMissing.Text = HttpUtility.HtmlEncode(slug);
                return;
            }

            Title = Trek.Name + " - Druk Trek";

            if (!Trek.HasDetails)
            {
                pnlDetails.Visible = false;
                pnlSoon.Visible = true;
                return;
            }

            string heroName = string.IsNullOrEmpty(Trek.ImageName) ? Trek.Slug : Trek.ImageName;
            string routeName = string.IsNullOrEmpty(Trek.RouteImageName) ? Trek.Slug + "-route" : Trek.RouteImageName;
            HeroImage = ResolveUrl(TrekData.ResolveImage(heroName));
            RouteImage = ResolveUrl(TrekData.ResolveImage(routeName));
            imgRoute.ImageUrl = RouteImage;
            PhoneLink = Trek.Phone.Replace(" ", "");

            pnlIntro.Visible = !string.IsNullOrEmpty(Trek.IntroHeading);
            if (!string.IsNullOrEmpty(Trek.GalleryImageName))
            {
                pnlGallery.Visible = true;
                imgGallery.ImageUrl = ResolveUrl(TrekData.ResolveImage(Trek.GalleryImageName));
                imgGallery.AlternateText = Trek.GalleryAlt ?? Trek.Name;
            }

            rptItinerary.DataSource = Trek.Itinerary;
            rptItinerary.DataBind();
            rptSections.DataSource = Trek.Sections;
            rptSections.DataBind();
        }
    }
}
