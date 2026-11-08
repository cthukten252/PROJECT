<%@ Page Title="Services" Language="C#" MasterPageFile="~/project.master" AutoEventWireup="true" CodeBehind="Service.aspx.cs" Inherits="PROJECT.Service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&family=Figtree:wght@300;400;500;700&display=swap" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Css/service.css") %>?v=2" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <section class="svc svc-dark">
        <div class="svc-hero">
            <div class="svc-text">
                <span class="svc-tag">Things to know</span>
                <h1>Bhutan Visa and Seasons</h1>
                <p>From Bhutanese visa requirements to the best months for trekking in Bhutan, we have all the information you need right here.</p>
            </div>
            <div class="svc-img">
                <asp:Image ID="imgVisa" runat="server" ImageUrl="/image/visa.png" AlternateText="Paro valley and airport, Bhutan" />
            </div>
        </div>

        <div class="svc-acc">
            <details name="visa">
                <summary>Bhutan Visa</summary>
                <div class="svc-body">
                    <p>On arrival at the Paro International Airport, an actual visa will be stamped on your passport on the strength of the Visa Approval Letter that we send you in advance. You will have to carry copy of this Visa Approval Letter to be shown in at check-in counters. If not you will be denied to board your flight to Bhutan. It is not required to carry passport size photographs. The name of the agency with whom you travel will be written on your passports.</p>
                    <p>You must at least have a blank page for Bhutan visa stamp. You must travel with the same passports, which you have provided us earlier for the process of your visa. If you travel with a new one, the number, which was there in your visa approval letter does not tally and will result in detention of your passport at the airport.</p>
                </div>
            </details>

            <details name="visa">
                <summary>Best time to trek in Bhutan</summary>
                <div class="svc-split">
                    <div class="svc-body">
                        <p>The vast differences in terrain and altitude in Bhutan affect its weather. In June, the monsoon rains from the Bay of Bengal in India bring high temperatures, humidity, and heavy rainfall. At the northern border where our trekking route lies, the weather is colder in the winter from December to February. Peaks and high passes (<em>La in Dzongkha</em>) are covered with snow, and trails become icy.</p>
                        <p class="gap">Therefore, the winter months of December, January, and February do not offer ideal conditions for trekking in Bhutan. The summer months from mid-June to August should also be avoided, as trails get muddy due to rains. The <strong>best months for trekking in Bhutan is spring: from March to June and autumn from mid-September to November</strong>.</p>
                    </div>
                </div>
            </details>

            <details name="visa">
                <summary>Getting into Bhutan</summary>
                <div class="svc-body">
                    <p>You can enter Bhutan either by air or land. Drukair and Tashi Air offers service to and from Bangkok, Delhi, Kolkata, Guwahati, Bagdogra, Dhaka, Kathmandu, and Singapore.</p>
                    <p>You can enter Bhutan overland through Phuntsholing, a border town in south-west Bhutan. The nearest airport is Bagdogra, which is a 4-hour commute (180 km). You can also enter through Samdrup Jongkhar, a small border town in the south-east. Samdrup Jongkhar is a 3-hour commute (110 km) from Guwahati, the nearest airport in Assam, India.</p>
                </div>
            </details>
        </div>
    </section>

    <section class="svc svc-blue">
        <div class="svc-hero">
            <div class="svc-text">
                <span class="svc-tag">Things to know</span>
                <h1>Practical Trekking Info</h1>
                <p>Treks are full camping journeys with a guide, chef, and horses for your gear. Here&rsquo;s what to expect on the trail, plus a packing list.</p>
            </div>
            <div class="svc-img">
                <asp:Image ID="imgInfo" runat="server" ImageUrl="/image/practical.png" AlternateText="Trekkers on a Bhutan trail" />
            </div>
        </div>

        <div class="svc-acc">
            <details name="info">
                <summary>How we operate our treks in Bhutan?</summary>
                <div class="svc-body">
                    <p>Trekking in Bhutan is different from Nepal. In Nepal, most of the trek routes run through spaced villages where trekkers find small lodges or teahouses for their shelter at night. You can also do an independent trek by arranging your own guide and porters and not being in a group. While on the other hand, trekking in Bhutan is a complete wilderness experience. In Bhutan, trekking is being arranged a camping trips. You will be on a guided trek sleeping inside tents at designated campsite. The assistants walk ahead of the trekking group each day and pitch tents before the trekkers arrive. A hot cuppa tea waiting in the dining tent is a most welcome treat after hours of tedious walk. All trekking groups are accompanied by a trained guide and trek chef. You will also have with you trek assistants and horsemen assembled from local community. Instead of porters, horses or yaks will carry your belongings and food supplies. Trekkers only have to carry their backpack for personal items such as camera, toiletries and water bottle etc.</p>
                </div>
            </details>

            <details name="info">
                <summary>Crew that will accompany you on trek</summary>
                <div class="svc-body">
                    <p>Each trek group is accompanied by a support team consisting of a trained guide, trek chef, assistant guides and local horsemen. Trekking is a joint effort and every crew has an important role to play. The guide and a trek chef play a lead role in overall supervision and control of the trek group. Some assistants will fetch water from spring or carry your packed lunch. Besides herding horses, horsemen will also help pitch tents and serve as man of errand. Horses carry the tents, sleeping bags, sleeping pads, food supply, cookware, gas, stoves, chairs, tables and your trekking gear. For a trek group of two people, there will be five staff &ndash; a guide, trek chef, an assistant and 2&ndash;3 horsemen and 8 horses to carry your equipment and supplies. For a group of 12 persons, there will be 11 support staff &ndash; a guide, chef, 4 assistants, 5 horsemen and 40 horses.</p>
                </div>
            </details>
        </div>
    </section>

    <section class="svc svc-light">
        <div class="svc-hero">
            <div class="svc-text">
                <span class="svc-tag">Health and wellness</span>
                <h1>Fitness &amp; Safety</h1>
                <p>How to prepare for a high-altitude trek: cardio, strength, pack-carrying hikes, and altitude training, plus guidance on fitness and health.</p>
            </div>
            <div class="svc-img">
                <asp:Image ID="imgFitness" runat="server" ImageUrl="/image/fitness.png" AlternateText="Trekker jumping on a mountain ridge" />
            </div>
        </div>

        <div class="svc-acc">
            <details name="fit">
                <summary>Cardio training</summary>
                <div class="svc-body">
                    <p>Build your endurance <strong>3&ndash;4 times a week</strong> with brisk walking, jogging, cycling or swimming. Start with 30 minutes and gradually increase to <strong>45&ndash;60 minutes</strong> over the weeks before your trek.</p>
                    <p>A strong cardio base makes long days on the trail feel much easier.</p>
                </div>
            </details>

            <details name="fit">
                <summary>Strength training</summary>
                <div class="svc-body">
                    <p>Focus on your <strong>legs, core and back</strong>. Squats, lunges, step-ups and planks help you handle steep climbs and descents, and protect your knees.</p>
                    <p>Two sessions a week in the months before your trip are a good target.</p>
                </div>
            </details>

            <details name="fit">
                <summary>Hiking-specific training</summary>
                <div class="svc-body">
                    <p>For hiking conditioning, train on trails with both <strong>ascents and descents</strong>, gradually increasing your distance and backpack weight as your fitness improves. Start by carrying a <strong>4&ndash;5 kg pack for approximately 5 km</strong>, then progressively build up until you can comfortably carry <strong>5&ndash;6 kg over 7&ndash;9 km</strong>.</p>
                    <p>This gradual progression helps your body adapt to the demands of carrying a pack over varied mountain terrain.</p>
                </div>
            </details>

            <details name="fit">
                <summary>Altitude preparation</summary>
                <div class="svc-body">
                    <p>As many of our treks reach elevations above <strong>11,000 feet (3,350 m)</strong>, preparing for altitude is an important part of your training. Where possible, spending time at elevations of <strong>3,000 m or higher before your trek</strong> can help your body begin adapting to altitude. However, previous acclimatization does not eliminate the risk of altitude sickness.</p>
                    <p>One useful training method is <strong>interval training</strong>. Climb a steep hill or set of stairs at a challenging pace for several minutes, then recover on the descent. Repeat for <strong>30&ndash;45 minutes</strong>. For hill walks, gradually add weight to your backpack until you can comfortably carry <strong>5&ndash;6 kg</strong> throughout the workout.</p>
                    <p>Training at altitude can complement your fitness preparation, but <strong>gradual acclimatization during the trek remains essential</strong>.</p>
                </div>
            </details>

            <details name="fit">
                <summary>Fitness and altitude</summary>
                <div class="svc-body">
                    <p>While good fitness is important, age alone should not discourage you from taking on a high-altitude trek. Many of our trekkers are over 50 and successfully complete our treks with proper preparation and acclimatization.</p>
                    <p>However, altitude can place additional demands on the body, particularly for people with existing medical conditions. If you have a <strong>known heart condition, experience symptoms during exercise, or have limitations on your physical activity</strong>, consult your doctor before undertaking a high-altitude trek.</p>
                    <p>If you are able to exercise comfortably at home without symptoms, maintaining a regular fitness routine and preparing appropriately for the trek can help you meet its physical demands.</p>
                </div>
            </details>
        </div>
    </section>

</asp:Content>