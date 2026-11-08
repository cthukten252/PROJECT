using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT
{
    public partial class Registration : Page
    {

        private static readonly string[,] TrekList =
        {
            { "jumolhari",             "Jumolhari Trek" },
            { "laya-gasa",             "Laya Gasa Trek" },
            { "druk-path",             "Druk Path Trek" },
            { "dagala-thousand-lakes", "Dagala Thousand Lakes Trek" },
            { "merak-sakteng",         "Merak and Sakteng Trek" },
            { "chele-la",              "Chele La Trek" },
            { "snowman",               "Snowman Trek" },
            { "nub-tshonapata",        "Nub Tshonapata Trek" },
            { "soi-yaksa",             "Soi Yaksa Trek" }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            Master.SolidHeader = true;

            if (!IsPostBack)
            {
                BindLists();
            }
        }

        private void BindLists()
        {

            ddlFrom.Items.Add(new ListItem("Please Select", ""));
            ddlTo.Items.Add(new ListItem("Please Select", ""));
            foreach (string country in Countries.All)
            {
                ddlFrom.Items.Add(new ListItem(country, country));
                ddlTo.Items.Add(new ListItem(country, country));
            }
            ddlTo.SelectedValue = "Bhutan";  

            ddlTrek.Items.Add(new ListItem("Please Select", ""));
            for (int i = 0; i < TrekList.GetLength(0); i++)
            {
                ddlTrek.Items.Add(new ListItem(TrekList[i, 1], TrekList[i, 0]));
            }

            
            string slug = (Request.QueryString["trek"] ?? "").Trim().ToLowerInvariant();
            ListItem match = ddlTrek.Items.FindByValue(slug);
            if (match != null)
            {
                ddlTrek.SelectedValue = slug;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string services = "";
            foreach (ListItem item in cblServices.Items)
            {
                if (item.Selected) services += (services.Length > 0 ? ", " : "") + item.Text;
            }

            litThanks.Text =
                "<h2>Thank you, " + HttpUtility.HtmlEncode(txtFirst.Text.Trim()) + "!</h2>" +
                "<p>We have received your registration for the " +
                HttpUtility.HtmlEncode(ddlTrek.SelectedItem.Text) +
                " and will contact you at " + HttpUtility.HtmlEncode(txtEmail.Text.Trim()) + " soon.</p>";

            pnlForm.Visible = false;
            pnlThanks.Visible = true;
        }
    }
}
