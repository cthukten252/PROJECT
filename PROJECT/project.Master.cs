using System;
using System.Web.UI;

namespace PROJECT
{
    public partial class project : MasterPage
    {
        public bool SolidHeader { get; set; }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (SolidHeader)
            {
                siteHeader.Attributes["class"] += " solid";
            }
        }
    }
}