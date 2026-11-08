using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;

namespace PROJECT
{
    
    public class TrekItem
    {
        public string Name { get; set; }
        public string Slug { get; set; }

        
        public string Image
        {
            get
            {
                string[] folders = { "~/image/treks/", "~/image/" };
                string[] exts = { ".jpg", ".jpeg", ".png", ".webp" };
                foreach (string folder in folders)
                {
                    foreach (string ext in exts)
                    {
                        string virtualPath = folder + Slug + ext;
                        if (File.Exists(HttpContext.Current.Server.MapPath(virtualPath)))
                            return virtualPath;
                    }
                }
                return "~/image/treks/" + Slug + ".jpg"; 
            }
        }

       
        public string Url { get { return "~/TrekDetail.aspx?trek=" + Slug; } }
    }

    public partial class Treks : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                rptTreks.DataSource = GetTreks();
                rptTreks.DataBind();
            }
        }

        private static List<TrekItem> GetTreks()
        {
            return new List<TrekItem>
            {
                new TrekItem { Name = "Jumolhari Trek",            Slug = "jumolhari" },
                new TrekItem { Name = "Laya Gasa Trek",            Slug = "laya-gasa" },
                new TrekItem { Name = "Druk Path Trek",            Slug = "druk-path" },
                new TrekItem { Name = "Dagala Thousand Lakes Trek", Slug = "dagala-thousand-lakes" },
                new TrekItem { Name = "Merak and Sakteng Trek",    Slug = "merak-sakteng" },
                new TrekItem { Name = "Chele La Trek",             Slug = "chele-la" },
                new TrekItem { Name = "Snowman Trek",              Slug = "snowman" },
                new TrekItem { Name = "Nub Tshonapata Trek",       Slug = "nub-tshonapata" },
                new TrekItem { Name = "Soi Yaksa Trek",            Slug = "soi-yaksa" }
            };
        }
    }
}
