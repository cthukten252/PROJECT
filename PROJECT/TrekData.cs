using System;
using System.Collections.Generic;
using System.IO;
using System.Web;

namespace PROJECT
{

    public class InfoSection
    {
        public string Heading { get; set; }
        public string Body { get; set; }
    }


    public class TrekInfo
    {
        public string Slug { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
        public string Description { get; set; }

        // Optional: file name (no extension) of the photo, found in image/treks/ or image/.
        // Leave empty to use the Slug (e.g. "jumolhari" -> image/jumolhari.jpg).
        public string ImageName { get; set; }
        public string RouteImageName { get; set; }   // empty = "<slug>-route"

        // Optional "About" text under the four cards, plus an optional extra photo
        public string IntroHeading { get; set; }
        public string IntroText { get; set; }
        public string GalleryImageName { get; set; } // file name (no extension), empty = no photo
        public string GalleryAlt { get; set; }

        public string TrekDays { get; set; }
        public string ItineraryDays { get; set; }
        public string GroupSize { get; set; }
        public string Difficulty { get; set; }
        public string HighestAltitude { get; set; }
        public string WalkDistance { get; set; }
        public string WalkTime { get; set; }
        public string Meals { get; set; }
        public string MealsLong { get; set; }

        public string Price { get; set; }

        public string JoinTitle { get; set; }
        public string JoinDate { get; set; }
        public string JoinText { get; set; }
        public string Phone { get; set; }

        public List<string> Itinerary { get; set; }
        public List<InfoSection> Sections { get; set; }

        // Treks without an itinerary show a "coming soon" message instead.
        public bool HasDetails
        {
            get { return Itinerary != null && Itinerary.Count > 0; }
        }
    }

    public static class TrekData
    {
        private static readonly Dictionary<string, TrekInfo> All = Build();

        // Returns null for an unknown slug (so nothing user-typed ever reaches the page)
        public static TrekInfo Get(string slug)
        {
            TrekInfo info;
            return (slug != null && All.TryGetValue(slug, out info)) ? info : null;
        }

        // Finds image/treks/<name>.jpg|jpeg|png|webp, then image/<name>...
        public static string ResolveImage(string name)
        {
            string[] folders = { "~/image/treks/", "~/image/" };
            string[] exts = { ".jpg", ".jpeg", ".png", ".webp" };
            foreach (string folder in folders)
                foreach (string ext in exts)
                {
                    string virtualPath = folder + name + ext;
                    if (File.Exists(HttpContext.Current.Server.MapPath(virtualPath)))
                        return virtualPath;
                }
            return "~/image/treks/" + name + ".jpg";
        }

        // Standard information sections. Use  Sections = StandardSections()  for a new trek,
        // or build your own list when a trek needs different text.
        private static List<InfoSection> StandardSections()
        {
            return new List<InfoSection>
            {
                new InfoSection { Heading = "Weather and Time",
                    Body = "The best months for trekking in Bhutan are mid-April to June and September to November. " +
                           "Spring is warm, with flowers in bloom. Autumn is colder, but usually brings clear skies and excellent mountain views." },
                new InfoSection { Heading = "Accommodations",
                    Body = "In the towns you stay in three-star hotels, with the option to upgrade to a higher-rated hotel. " +
                           "While you are on the trek, you sleep in tented camps." },
                new InfoSection { Heading = "Meals",
                    Body = "Meals include Bhutanese, Indian, Chinese and continental dishes, and you get the same variety on the trail. " +
                           "Breakfast has bread, eggs, jam, honey, biscuits, hot drinks, oats, cereal and sausages. Lunch is a hot packed meal, " +
                           "and lunch and dinner menus include rice, soup, noodles, vegetables, meat, fish, lentils and fruit.\n\n" +
                           "Your trek chef may add a few extra dishes to the regular menu. Past guests often mention our cooks in their reviews, " +
                           "and we take real pride in the care that goes into every meal on the trail." },
                new InfoSection { Heading = "Trekking Crew",
                    Body = "Your crew is made up of a guide, a trek chef, assistants, and horsemen with pack horses, and it grows with the size of your group. " +
                           "For example, two guests are looked after by about five crew members and six horses, " +
                           "while a group of four has a guide, a chef, two assistants, two to three horsemen and around sixteen horses." },
                new InfoSection { Heading = "When to Book? Flights and Join-in",
                    Body = "This trip starts at Paro. Drukair and Bhutan Airlines fly to and from Bangkok, Delhi, Kathmandu, Dhaka, Singapore and Dubai. " +
                           "Flights and hotel rooms in Bhutan are limited, so we suggest booking at least six months before your departure date." },
                new InfoSection { Heading = "Things to Pack",
                    Body = "Pack separately for each part of the trip. On the trail you need proper hiking gear: moisture-wicking layers, sturdy waterproof boots " +
                           "and warm insulation for the high camps. In Thimphu and Paro, comfortable casual clothes are fine, and modest clothing is appreciated at temples and monasteries. " +
                           "Email us for a full packing list." }
            };
        }

        private static Dictionary<string, TrekInfo> Build()
        {
            var d = new Dictionary<string, TrekInfo>();

            // ---- The other treks: name only for now (add details the same way as Jumolhari) ----
            string[,] others =
            {
                { "dagala-thousand-lakes", "Dagala Thousand Lakes Trek" },
                { "merak-sakteng", "Merak and Sakteng Trek" },
                { "chele-la", "Chele La Trek" },
                { "snowman", "Snowman Trek" },
                { "nub-tshonapata", "Nub Tshonapata Trek" },
                { "soi-yaksa", "Soi Yaksa Trek" }
            };
            for (int i = 0; i < others.GetLength(0); i++)
                d[others[i, 0]] = new TrekInfo { Slug = others[i, 0], Name = others[i, 1] };

            // ---- Jumolhari: full details. Check every value and replace with your own. ----
            d["jumolhari"] = new TrekInfo
            {
                Slug = "jumolhari",
                Name = "Jumolhari Trek",
                Location = "Paro, Bhutan",

                // CHANGE THE PHOTOS HERE (file names without .jpg/.png, kept in the image folder):
                ImageName = "jumo",             // image/jumo.png
                RouteImageName = "jroute",      // image/jroute.png

                Description =
                    "Walk beneath Mount Jumolhari on one of Bhutan's classic high-altitude treks. " +
                    "The trail climbs from the Paro valley through forest and yak pastures to the " +
                    "base camp at Jangothang, then crosses high passes with wide views of the " +
                    "Himalayan peaks.",

                TrekDays = "7",
                ItineraryDays = "12",
                GroupSize = "2+",
                Difficulty = "Hard",
                HighestAltitude = "4912 m",
                WalkDistance = "17.5 km",
                WalkTime = "6 h",
                Meals = "3 meals",
                MealsLong = "Breakfast, lunch, dinner & snacks",

                Price = "$3,000",   // TODO: your real price per person

                JoinTitle = "Join our 7-day Autumn Jumolhari Trek",
                JoinDate = "November 02\u201313, 2026",   // TODO: your real dates
                JoinText =
                    "Travelling alone and want to join a group? Get in touch and we will " +
                    "add you to our next Jumolhari departure: a 12-day itinerary with 7 days on the trail.",
                Phone = "+975 00 000 000",                // TODO: your real number

                Itinerary = new List<string>
                {
                    "Day 1: Arrive in Paro",
                    "Day 2: Acclimatisation hike to Tiger's Nest Monastery",
                    "Day 3: Paro to Shingkarap \u2013 the trek begins",
                    "Day 4: Shingkarap to Soi Thangkha",
                    "Day 5: Soi Thangkha to Jangothang Base Camp",
                    "Day 6: Rest and explore around Jangothang",
                    "Day 7: Jangothang to Lingzhi",
                    "Day 8: Lingzhi to Shodu",
                    "Day 9: Shodu to Barshong, then drive to Thimphu \u2013 the trek ends",
                    "Day 10: Thimphu to Punakha",
                    "Day 11: Punakha to Paro",
                    "Day 12: Depart from Paro"
                },

                Sections = new List<InfoSection>
                {
                    new InfoSection { Heading = "Weather and Time",
                        Body = "The most comfortable trekking seasons are spring (mid-April to June) and autumn (September to November). " +
                               "Spring brings mild days and flowering rhododendrons. Autumn is cooler, but usually gives crisp, clear skies and the best mountain views." },
                    new InfoSection { Heading = "Accommodations",
                        Body = "In the towns you stay in comfortable three-star hotels, with the option to upgrade. " +
                               "On the trail you sleep in tented camps that our crew sets up at every stop." },
                    new InfoSection { Heading = "Meals",
                        Body = "Meals mix Bhutanese, Indian, Chinese and continental dishes. Breakfast is hot and filling, lunch is usually a packed meal on the trail, " +
                               "and dinner is a hot, multi-course meal in camp. Tea, coffee and snacks are served throughout the day." },
                    new InfoSection { Heading = "Luggage & Horses",
                        Body = "Pack horses carry your main bag, up to 15 kg per person, so you only walk with a small daypack. " +
                               "Loads are shared fairly and the animals get proper feed and rest. Anything you don't need on the trail is stored safely and returned at the end." },
                    new InfoSection { Heading = "When to Book? Flights and Join-in",
                        Body = "This trek starts and finishes at Paro. Flights and hotel rooms in Bhutan are limited, so we recommend booking several months before your departure date." },
                    new InfoSection { Heading = "Things to Pack",
                        Body = "Bring layers for the trail, waterproof boots, a warm jacket and a sleeping-bag liner for cold nights. " +
                               "Smart casual clothes suit the towns, and modest clothing is appreciated at temples. Contact us for the full packing list." }
                }
            };


            // ---- Laya Gasa: full details. Check every value and replace with your own. ----
            d["laya-gasa"] = new TrekInfo
            {
                Slug = "laya-gasa",
                Name = "Laya Gasa Trek",
                Location = "Laya | Gasa, Bhutan",

                // Photos (file names without extension, kept in the image folder).
                // Leave these out to use the defaults: laya-gasa.jpg and laya-gasa-route.jpg
                // ImageName = "laya-hero",
                // RouteImageName = "laya-map",
                GalleryImageName = "laya-culture",   // image/laya-culture.jpg  (people / culture photo)
                GalleryAlt = "People of Laya in traditional dress",

                Description =
                    "A long, demanding journey along the Tibetan border that crosses four passes above 4,500 m. " +
                    "The trail starts below Mount Jumolhari and leads on to the semi-nomadic villages of Lingzhi and Laya, " +
                    "through some of the most unspoiled alpine scenery in the Himalayas.",

                TrekDays = "11",
                ItineraryDays = "16",
                GroupSize = "2+",
                Difficulty = "Difficult",
                HighestAltitude = "5005 m",
                WalkDistance = "17 km",
                WalkTime = "6 h",
                Meals = "3 meals",
                MealsLong = "Breakfast, lunch, dinner & snacks",

                Price = "$4,000",   // TODO: your real price per person

                JoinTitle = "Join our Autumn Laya Gasa Trek",
                JoinDate = "Nov 02\u201317, 2026",       // TODO: your real dates
                JoinText =
                    "Travelling alone and want to join a group? Get in touch and we will add you to our next " +
                    "Laya Gasa departure: a 16-day itinerary with 11 days on the trail.",
                Phone = "+975 00 000 000",                // TODO: your real number

                IntroHeading = "Walk through semi-nomadic villages with a culture, traditions and dress all their own.",
                IntroText =
                    "Laya Gasa is one of Bhutan's finest long-distance treks. It follows the Tibetan border through " +
                    "some of the most untouched Himalayan landscapes, with long walking days, most nights spent around " +
                    "4,000 m and four high passes above 4,500 m. It is a real test of endurance, and it rewards you with " +
                    "some of the best alpine scenery in the Himalayas.",   // TODO: check the daily distance against your own figures

                Itinerary = new List<string>
                {
                    "Day 1: Fly into Paro, Bhutan",
                    "Day 2: Acclimatisation hike to Tiger's Nest Monastery",
                    "Day 3: Paro to Shingkarap \u2013 the trek begins",
                    "Day 4: Shingkarap to Soi Thangkha",
                    "Day 5: Soi Thangkha to Jangothang Base Camp",
                    "Day 6: Rest and explore around Jangothang",
                    "Day 7: Jangothang to Lingzhi",
                    "Day 8: Lingzhi to Chebisa",
                    "Day 9: Chebisa to Shoumothang",
                    "Day 10: Shoumothang to Robluthang",
                    "Day 11: Robluthang to Lingmithang",
                    "Day 12: Lingmithang to Laya",
                    "Day 13: Laya to Punakha \u2013 the trek ends",
                    "Day 14: Punakha to Thimphu (76 km, about 2 hours)",
                    "Day 15: Explore Thimphu, the capital",
                    "Day 16: Departure"
                },

                Sections = new List<InfoSection>
                {
                    new InfoSection { Heading = "Weather and Time",
                        Body = "The best months for trekking in Bhutan are mid-April to June and September to November. " +
                               "Spring is warm, with flowers in bloom. Autumn is colder, but usually brings clear skies and excellent mountain views." },
                    new InfoSection { Heading = "Accommodations",
                        Body = "In the towns you stay in three-star hotels, with the option to upgrade to a higher-rated hotel. " +
                               "While you are on the trek, you sleep in tented camps." },
                    new InfoSection { Heading = "Meals",
                        Body = "Meals include Bhutanese, Indian, Chinese and continental dishes, and you get the same variety on the trail. " +
                               "Breakfast has bread, eggs, jam, honey, biscuits, hot drinks, oats, cereal and sausages. Lunch is a hot packed meal, " +
                               "and lunch and dinner menus include rice, soup, noodles, vegetables, meat, fish, lentils and fruit.\n\n" +
                               "Your trek chef may add a few extra dishes to the regular menu. Past guests often mention our cooks in their reviews, " +
                               "and we take real pride in the care that goes into every meal on the trail." },
                    new InfoSection { Heading = "Trekking Crew",
                        Body = "Your crew is made up of a guide, a trek chef, assistants, and horsemen with pack horses, and it grows with the size of your group. " +
                               "For example, two guests are looked after by about five crew members and six horses, " +
                               "while a group of four has a guide, a chef, two assistants, two to three horsemen and around sixteen horses." },
                    new InfoSection { Heading = "When to Book? Flights and Join-in",
                        Body = "This trip starts at Paro. Drukair and Bhutan Airlines fly to and from Bangkok, Delhi, Kathmandu, Dhaka, Singapore and Dubai. " +
                               "Flights and hotel rooms in Bhutan are limited, so we suggest booking at least six months before your departure date." },
                    new InfoSection { Heading = "Things to Pack",
                        Body = "Pack separately for each part of the trip. On the trail you need proper hiking gear: moisture-wicking layers, sturdy waterproof boots " +
                               "and warm insulation for the high camps. In Thimphu and Paro, comfortable casual clothes are fine, and modest clothing is appreciated at temples and monasteries. " +
                               "Email us for a full packing list." }
                }
            };

            // ---- Druk Path: full details. Check every value and replace with your own. ----
            d["druk-path"] = new TrekInfo
            {
                Slug = "druk-path",
                Name = "Druk Path Trek",
                Location = "Thimphu & Paro, Bhutan",

                // Photos (file names without extension, kept in the image folder).
                // Defaults if you leave these out: druk-path.jpg and druk-path-route.jpg
                // ImageName = "druk-path-hero",
                // RouteImageName = "druk-path-map",
                GalleryImageName = "druk-path-camp",   // image/druk-path-camp.jpg  (tents by the lake)
                GalleryAlt = "Tents beside a mountain lake at dawn",

                Description =
                    "Follow an old trading route on one of Bhutan's best short treks, linking the Paro and Thimphu valleys. " +
                    "The trail leaves apple orchards and the ruined Jele Dzong behind, climbs above the tree line and crosses " +
                    "high passes such as Phume La (4,210 m), passing clear lakes and yak herders' camps with views of Jumolhari, " +
                    "Jichu Drake and Gangkar Puensum, before descending by Phajoding Monastery into Thimphu.",

                TrekDays = "4",
                ItineraryDays = "8",
                GroupSize = "2+",
                Difficulty = "Medium",
                HighestAltitude = "4235 m",
                WalkDistance = "11 km",
                WalkTime = "5 h",
                Meals = "3 meals",
                MealsLong = "Breakfast, lunch, dinner & snacks",

                Price = "$2,000",   // TODO: your real price per person

                JoinTitle = "Join our 4-day Autumn Druk Path Trek",
                JoinDate = "Nov 02\u201309, 2026",       // TODO: your real dates
                JoinText =
                    "Travelling alone and want to join a group? Get in touch and we will add you to our next " +
                    "Druk Path departure: an 8-day itinerary with 4 days on the trail.",
                Phone = "+975 00 000 000",                // TODO: your real number

                IntroHeading = "A trail through rhododendron forest, alpine yak pastures and lakes stocked with mountain trout.",
                IntroText =
                    "The Druk Path is one of the finest short treks in Bhutan. It follows an old trading route over high passes " +
                    "between the Paro and Thimphu valleys. You start by climbing through apple orchards and pine forest to the ruined " +
                    "Jele Dzong, a fortress on a grassy ridge with views of Mount Jumolhari to the north. Over the next days you rise " +
                    "above the tree line and cross several passes, including Phume La (4,210 m), passing clear lakes and yak herders' camps, " +
                    "with wide views along the Bhutan\u2013Tibet border to Jumolhari, Jichu Drake and Gangkar Puensum. " +
                    "The final descent through pine and juniper forest, past Phajoding Monastery, brings you into Thimphu, the capital.",

                // TODO: your screenshots show 5 days here but "8" itinerary days above. Add the arrival,
                // sightseeing and departure days if your full itinerary has them.
                Itinerary = new List<string>
                {
                    "Day 1: Paro to Jele Dzong, past Damchena village",
                    "Day 2: Jele Dzong to Jangchulakha",
                    "Day 3: Jangchulakha to Jimilangtsho Lake",
                    "Day 4: Jimilangtsho via Janetsho Lake to Simkota",
                    "Day 5: Simkota via Phajoding (3,870 m) to Thimphu"
                },

                Sections = StandardSections()
            };

            return d;
        }
    }
}
