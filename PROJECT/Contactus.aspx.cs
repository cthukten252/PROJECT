using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT
{
    public partial class Contactus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            litThanks.Text = "Thank you, " + HttpUtility.HtmlEncode(txtName.Text.Trim()) +
                             "! We have received your message and will reply soon.";
            pnlForm.Visible = false;
            pnlThanks.Visible = true;
        }
    }
}