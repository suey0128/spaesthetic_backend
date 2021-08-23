puts "Clearing old data..."
Application.destroy_all
Invitation.destroy_all
ReferralService.destroy_all
Collab.destroy_all
Review.destroy_all
Message.destroy_all
Campaign.destroy_all
ContentCreator.destroy_all
Business.destroy_all
User.destroy_all


puts "Seeding businesss..."
b1 = Business.create!( 
    name: "Alfred Coffee", 
    business_type: "restaurant", 
    address: "11908 San Vicente Blvd", 
    city: "Los Angeles", 
    state: "CA", 
    zip:90049, 
    country: "US", 
    website: "https://alfred.la/", 
    description: "We opened the doors to our first location, our Melrose Place cafe, in January of 2013. Over the ensuing months Alfred became a destination cafe known for its impeccable style, and a fixture of the Los Angeles food and beverage scene. We’ve labored hard to establish a loyal clientele, and attract attention from national newsmedia. As we continue to grow we strive to remain true to our ideals of providing delicious coffee, and unparalleled hospitality.", profile_pic: "https://is5-ssl.mzstatic.com/image/thumb/Purple124/v4/06/1a/c1/061ac1c1-3345-fb2a-78e9-16826860ebbc/source/256x256bb.jpg"
)

b2 = Business.create!(
    name: "Miss Lola", 
    business_type: "retail", 
    address: "8350 Rex Rd Unit B", 
    city: "Pico Rivera", 
    state: "CA", 
    zip:90660, 
    country: "US", 
    website: "https://www.misslola.com/", 
    description: "If you love shoes, you love Miss LOLA", 
    profile_pic: "https://pbs.twimg.com/profile_images/1024708986010910721/QTotDXnZ_400x400.jpg"
)

b3 = Business.create!(
    name: "Los Angeles Public Library", 
    business_type: "others", 
    address: "630 West 5th Street", 
    city: "Los Angeles", 
    state: "CA", 
    zip:90071, 
    country: "US", 
    website: "https://www.lapl.org/", 
    description: "The Los Angeles Public Library system serves the residents of the City of Los Angeles. The system holds more than six million volumes, and with over 18 million residents in the Los Angeles Metropolitan area, it serves the largest population of any publicly funded library system in the United States. ", 
    profile_pic: "https://upload.wikimedia.org/wikipedia/en/c/c8/Lapllogo.png"
)

b4 = Business.create!(
    name: "Sneakertopia", 
    business_type: "event", 
    address: "6060 Center Drive, 10th Floor", 
    city: "Los Angeles", 
    state: "CA", 
    zip:90045, 
    country: "US", 
    website: "https://www.sneakertopia.com/", 
    description: "It's more than Sports. It's more than Hip Hop. Sneakertopia is the ultimate expression of art and culture connected to all things sneakers! Come to be inspired by street art masterpieces, rare collectors’ kicks, exclusive merch, and an all new Augmented Reality experience that reveals the icons and creators of sneaker culture.", 
    profile_pic: "https://i.pinimg.com/236x/59/26/94/59269432d498198032dc86b2531bc34a.jpg"
)

b5 = Business.create!(
    name: "The Donut Hole", 
    business_type: "restaurant", 
    address: "15300 Amar Rd", 
    city: "La Puente", 
    state: "CA", 
    zip:91744, 
    country: "US", 
    website: "", 
    description: "The Donut Hole is a bakery and landmark in La Puente, California. An example of programmatic architecture, the building is shaped like two giant donuts through which customers drive to place their orders. The bakery is one of the most photographed donut shops in the United States.", 
    profile_pic: "https://via.placeholder.com/280x350.png"
)



puts "Seeding contentCreators..."
cc1 = ContentCreator.create!( 
    first_name:"Leslie", 
    last_name:"Great", 
    gender:"Female", 
    instagram_username: "@my_adorkable_adventures", 
    instagram_url:"https://www.instagram.com/my_adorkable_adventures/", 
    instagram_follower: 11600, 
    instagram_female_follower_ratio:70, 
    instagram_top1_follow_location:"Los Angeles", 
    instagram_connection_permission: true, 
    ave_rate_per_campaign: 10, 
    paypal_account: "my_adorkable_adventures@gmail.com", 
    profile_pic:"https://cdn.shopify.com/s/files/1/0511/5533/files/Screen_Shot_2021-08-05_at_4.09.03_PM_1110x.png?v=1628205051", 
    website:"https://adorkableadventures.com/", 
    about_me:"L𝐞𝐬𝐥𝐢𝐞 🙋🏻‍♀️ LA Blogger. 👩🏻‍🎓 BA, MA, MBA 23’. 📍Los Angeles, California. 📸 Travel, Food, Nature, Lifestyle. 🧸 Jeremiah 29:11 🇺🇸 🇸🇻"
)

cc2 = ContentCreator.create!(
    first_name:"Angela", 
    last_name:"Amazing",
    gender:"Female", 
    instagram_username: "@angela_losangeleslife", 
    instagram_url:"https://www.instagram.com/angela_losangeleslife/", 
    instagram_follower: 3361, 
    instagram_female_follower_ratio:50, 
    instagram_top1_follow_location:"Los Angeles", 
    instagram_connection_permission: true, 
    ave_rate_per_campaign: 0, 
    paypal_account: "angela_losangeleslife@gmail.com", 
    profile_pic:"/img/cc_profile_pic/angela_losangeleslife.png", 
    website:"", 
    about_me:"LA | ART and ADVENTURES, Digital Creator, LA girl and my LA life. Come explore with me!📍INSTAWORTHY LOCATIONS, 📍PHOTO SPOTS, 📍LA TRAVEL, 📍LA ART/MURALS, 🔎💃🏼❤️💯🎨📸"
)

cc3 = ContentCreator.create!(
    first_name:"Michelle", 
    last_name:"Wonderful",
    gender:"female", 
    instagram_username: "@shellayorona", 
    instagram_url:"https://www.instagram.com/shellayorona/", 
    instagram_follower: 11800, 
    instagram_female_follower_ratio:80, 
    instagram_top1_follow_location:"Los Angeles", 
    instagram_connection_permission: true, 
    ave_rate_per_campaign: 0, 
    paypal_account: "shellayorona@gmail.com", 
    profile_pic:"/img/cc_profile_pic/shellayorona.png",
    website:"", 
    about_me:"🌊California🌴 faith/family/influencer💃🏻 Live like Sam😇 "
)

cc4 = ContentCreator.create!(
    first_name:"Victor", 
    last_name:"Rangel",
    gender:"Male", 
    instagram_username: "@lifeofvic", 
    instagram_url:"https://www.instagram.com/lifeofvic/", 
    instagram_follower: 1871, 
    instagram_female_follower_ratio:40, 
    instagram_top1_follow_location:"Los Angeles", 
    instagram_connection_permission: true, 
    ave_rate_per_campaign: 0, 
    paypal_account: "lifeofvic@gmail.com", 
    profile_pic:"/img/cc_profile_pic/lifeofvic.png",
    website:"https://podcasts.apple.com/us/podcast/lifehacksla-hacking-the-best-of-los-angeles/id1468920120?i=1000498171894", 
    about_me:"Personal Blog.
    Exploring SoCal one weekend at a time.
    Los Angeles | OC | San Diego | Travel
    #RangelAdventures #ExploreCalifornia #losangeles #lifestyle."
)


cc5 = ContentCreator.create!(
    first_name:"Eli", 
    last_name:"Brilliant",
    gender:"Female", 
    instagram_username: "@shedreamstravel", 
    instagram_url:"https://www.instagram.com/lifeofvic/", 
    instagram_follower: 8798, 
    instagram_female_follower_ratio:80, 
    instagram_top1_follow_location:"Los Angeles", 
    instagram_connection_permission: true, 
    ave_rate_per_campaign: 0, 
    paypal_account: "shedreamstravel@gmail.com", 
    profile_pic:"/img/cc_profile_pic/shedreamstravel.png",
    website:"https://podcasts.apple.com/us/podcast/lifehacksla-hacking-the-best-of-los-angeles/id1468920120?i=1000498171894", 
    about_me:"Eli TRAVEL BLOGGER & CREATOR
    Blogger
    Just a girl inspiring you to chase your dreams.
    TRAVEL | LIFESTYLE | PHOTO IDEAS | POCKET GUIDES
    Top 25 LA Bloggers Feb2021"
)

puts "Seeding users..."
u1 = User.create!(
    platform_user_id:b1.id, 
    platform_user_type:"Business", 
    username: "alfred_coffee", 
    email: "info@alfred_coffee.com", 
    password_digest: User.digest('123')
)

u2 = User.create!(
    platform_user_id:b2.id, 
    platform_user_type:"Business", 
    username: "miss_lola", 
    email: "info@miss_lola.com", 
    password_digest: User.digest('123')
)

u3 = User.create!(
    platform_user_id:cc1.id, 
    platform_user_type:"ContentCreator", 
    username: "my_adorkable_adventures", 
    email: "my_adorkable_adventures@gmail.com", 
    password_digest: User.digest('123')
)

u4 = User.create!(
    platform_user_id:cc2.id, 
    platform_user_type:"ContentCreator", 
    username: "angela_losangeleslife", 
    email: "angela_losangeleslife@gmail.com", 
    password_digest: User.digest('123')
)

u5 = User.create!(
    platform_user_id:b3.id, 
    platform_user_type:"Business", 
    username: "lapl", 
    email: "infoe@lapl.com", 
    password_digest: User.digest('123')
)

u6 = User.create!(
    platform_user_id:b4.id, 
    platform_user_type:"Business", 
    username: "sneakertopia", 
    email: "infoe@sneakertopia.com", 
    password_digest: User.digest('123')
)

u7 = User.create!(
    platform_user_id:b5.id, 
    platform_user_type:"Business", 
    username: "the_donut_hole", 
    email: "infoe@the_donut_hole.com", 
    password_digest: User.digest('123')
)

u8 = User.create!(
    platform_user_id:cc3.id, 
    platform_user_type:"ContentCreator", 
    username: "shellayorona", 
    email: "shellayorona@gmail.com", 
    password_digest: User.digest('123')
)

u9 = User.create!(
    platform_user_id:cc4.id, 
    platform_user_type:"ContentCreator", 
    username: "lifeofvic", 
    email: "lifeofvic@gmail.com", 
    password_digest: User.digest('123')
)

u10 = User.create!(
    platform_user_id:cc5.id, 
    platform_user_type:"ContentCreator", 
    username: "shedreamstravel", 
    email: "shedreamstravel@gmail.com", 
    password_digest: User.digest('123')
)

puts "Seeding campaigns..."
cp1 = Campaign.create!(
    business_id:b1.id, 
    name:"Coffee First!! @Alfred Coffee Melrose Place", 
    image:"https://cdn.vox-cdn.com/thumbor/vjciPYMEQy2ez9UIj_sksSOqC_4=/0x0:1000x667/1200x800/filters:focal(420x253:580x413)/cdn.vox-cdn.com/uploads/chorus_image/image/61171177/01_2013_ALFRED_COFFEE-3.0.0.1412833624.0.jpeg", 
    location_name:"Alfred Coffee Melrose Place", 
    location_type:"cafe", 
    address:"8428 Melrose Pl", 
    city:"Los Angeles", 
    state:"CA", 
    zip:90069, 
    country:"US", 
    compensation_type:"Service", 
    compensation_market_value:50, 
    start_date:Date.parse('2021-09-20'), 
    end_date:Date.parse('2021-09-20'), 
    application_deadline: Date.parse('2021-08-20'), 
    require_following_minimum:1000, 
    require_following_location:"Los Angeles", 
    require_following_female_ratio:50, 
    require_gender:"none", 
    require_others:"over 18 year old", 
    description:"Alfred Coffee is going to hold a influencer day on Sep.20 at our Melrose Place location. We will be offering free coffe to collb influencers. let's connect and make some content together! ", 
    content_sent_by:Date.parse('2021-10-01'), 
    must_post_by: Date.parse('2021-10-10')
) 
#current, past apply deadline

cp2 = Campaign.create!(
    business_id:b1.id, 
    name:"Free coffee Month! @ Alfred Coffee Brentwood", 
    image:"https://cdn.shopify.com/s/files/1/2182/5585/files/BW1.png?v=1575678120", 
    location_name:"Alfred Coffee Brentwood", 
    location_type:"cafe", 
    address:"11908 San Vicente Blvd", 
    city:"Los Angeles", 
    state:"CA", 
    zip:90049, 
    country:"US", 
    compensation_type:"Service", 
    compensation_market_value:10.00, 
    start_date:Date.parse('2021-10-01'), 
    end_date:Date.parse('2021-10-30'), 
    application_deadline: Date.parse('2021-10-30'), 
    require_following_minimum:1000, 
    require_following_location:"Los Angeles", 
    require_following_female_ratio:0, 
    require_gender:"", 
    require_others:"Alfred Coffee is offering free coffee for the whole October! all our collab influencers can get free coffee under $10.", 
    description:"Alfred Coffee Brentwood", 
    content_sent_by:Date.parse('2021-11-10'), 
    must_post_by: Date.parse('2021-11-11')
) #current

cp3 = Campaign.create!(
    business_id:b1.id, 
    name:"Coffee Party @ Alfred Coffee Beverly Hills", 
    image:"https://mostlovelythings.com/wp-content/uploads/2018/03/alfred-coffee-beverly-hills-heart-wall.jpg", 
    location_name:"Alfred Coffee Beverly Hills", 
    location_type:"cafe", 
    address:"490 N Beverly Dr", 
    city:"Beverly Hills", 
    state:"CA", 
    zip:90210, 
    country:"US", 
    compensation_type:"Service", 
    compensation_market_value:70, 
    start_date:Date.parse('2021-05-01'), 
    end_date:Date.parse('2021-05-01'), 
    application_deadline: Date.parse('2021-03-20'), 
    require_following_minimum:1000, 
    require_following_location:"Los Angeles", 
    require_following_female_ratio:0, 
    require_gender:"", 
    require_others:"over 18 years old", 
    description:"Alfred Coffee is gonna hold a exclusive party on Jun 20 at our Beverly Hills location to promote our new summer drinks. All the collab content creators will of course be able to be the first ones to taste our new drinks, but also will get free Aflred Coffee T shirt! Apply now!", 
    content_sent_by:Date.parse('2021-05-20'), 
    must_post_by: Date.parse('2021-06-01')
) 
#past

cp4 = Campaign.create!(
    business_id:b2.id, 
    name:"Shoe and flowers!", 
    image:"/img/campaign_image/cp4.png", 
    location_name:"Miss LOLA", 
    location_type:"retail", 
    address:"8350 REX RD. B", 
    city:"PICO RIVERA", 
    state:"CA", 
    zip:"90660", 
    country:"US", 
    compensation_type:"Monetary", 
    compensation_market_value:20, 
    start_date:Date.parse('2021-12-3'), 
    end_date:Date.parse('2021-12-5'), 
    application_deadline: Date.parse('2021-11-10'), 
    require_following_minimum:5000, 
    require_following_location:"Los Angeles", 
    require_following_female_ratio:70, 
    require_gender:"Female", 
    require_others:"over 18 year old", 
    description:"We are promoting our store opening. We are gonna have a big flower wall decore inside the store. Come and make some awesome content!", 
    content_sent_by:Date.parse('2021-12-10'), 
    must_post_by: Date.parse('2021-12-20')
) #current

cp5 = Campaign.create!(
    business_id:b3.id, 
    name:"Los Angeles Public Library", 
    image:"/img/campaign_image/cp5.png", 
    location_name:"Los Angeles Public Library", 
    location_type:"library", 
    address: "630 West 5th Street", 
    city: "Los Angeles", 
    state: "CA", 
    zip:90071, 
    country: "US", 
    compensation_type:"Monetary", 
    compensation_market_value:"20", 
    start_date:Date.parse('2021-09-11'), 
    end_date:Date.parse('2021-09-20'), 
    application_deadline: Date.parse('2021-09-01'), 
    require_following_minimum:10000, 
    require_following_location:"Los Angeles", 
    require_following_female_ratio:0, 
    require_gender:"", 
    require_others:"over 18", 
    description:"Los Angeles Public Library is promoting READING. come inspire our community to read more!", 
    content_sent_by:Date.parse('2021-10-1'), 
    must_post_by: Date.parse('2021-10-10')
) #current

cp6 = Campaign.create!(
    business_id:b4.id, 
    name:"Sneakertopia reOpening after pandemic in LA", 
    image:"/img/campaign_image/cp6.png", 
    location_name:"Sneakertopia", 
    location_type:"event", 
    address: "6081 Center Drive, Ste 222", 
    city: "Los Angeles", 
    state: "CA", 
    zip:90045, 
    country: "US", 
    compensation_type:"Service", 
    compensation_market_value:35.00, 
    start_date:Date.parse('2021-10-11'), 
    end_date:Date.parse('2021-10-20'), 
    application_deadline: Date.parse('2021-09-15'), 
    require_following_minimum:10000, 
    require_following_location:"Los Angeles", 
    require_following_female_ratio:0, 
    require_gender:"", 
    require_others:"over 18", 
    description:"Sneakertopia is Back from the pandemic and keep on celebrating sneakers! We have awesome interior for you to make your social media content. Come apply!", 
    content_sent_by:Date.parse('2021-11-1'), 
    must_post_by: Date.parse('2021-11-10')
) #current

cp7 = Campaign.create!(
    business_id:b5.id, 
    name:"Who doesn't want Donuts?", 
    image:"/img/campaign_image/cp7.png", 
    location_name:"The Donut Hole", 
    location_type:"restaurant", 
    address: "15300 Amar Rd", 
    city: "La Puente", 
    state: "CA", 
    zip:91744, 
    country: "US", 
    compensation_type:"Service", 
    compensation_market_value:10.00, 
    start_date:Date.parse('2021-09-11'), 
    end_date:Date.parse('2021-09-15'), 
    application_deadline: Date.parse('2021-09-05'), 
    require_following_minimum:500, 
    require_following_location:"Los Angeles", 
    require_following_female_ratio:0, 
    require_gender:"", 
    require_others:"over 18", 
    description:"Come take some photos of our Donut Hole!", 
    content_sent_by:Date.parse('2021-10-06'), 
    must_post_by: Date.parse('2021-10-04')
) #current

cp8 = Campaign.create!(
    business_id:b5.id, 
    name:"Who doesn't want Donuts?", 
    image:"/img/campaign_image/cp7.png", 
    location_name:"The Donut Hole", 
    location_type:"restaurant", 
    address: "15300 Amar Rd", 
    city: "La Puente", 
    state: "CA", 
    zip:91744, 
    country: "US", 
    compensation_type:"Service", 
    compensation_market_value:10.00, 
    start_date:Date.parse('2021-09-11'), 
    end_date:Date.parse('2021-09-15'), 
    application_deadline: Date.parse('2021-09-05'), 
    require_following_minimum:20000, 
    require_following_location:"Los Angeles", 
    require_following_female_ratio:0, 
    require_gender:"", 
    require_others:"over 18", 
    description:"Come take some photos of our Donut Hole!", 
    content_sent_by:Date.parse('2021-10-06'), 
    must_post_by: Date.parse('2021-10-04')
) #current, filter out by require_following_minimum

cp9 = Campaign.create!(
    business_id:b5.id, 
    name:"Who doesn't want Donuts?", 
    image:"/img/campaign_image/cp7.png", 
    location_name:"The Donut Hole", 
    location_type:"restaurant", 
    address: "15300 Amar Rd", 
    city: "La Puente", 
    state: "CA", 
    zip:91744, 
    country: "US", 
    compensation_type:"Service", 
    compensation_market_value:10.00, 
    start_date:Date.parse('2021-09-11'), 
    end_date:Date.parse('2021-09-15'), 
    application_deadline: Date.parse('2021-09-05'), 
    require_following_minimum:2000, 
    require_following_location:"Los Angeles", 
    require_following_female_ratio:0, 
    require_gender:"Male", 
    require_others:"over 18", 
    description:"Come take some photos of our Donut Hole!", 
    content_sent_by:Date.parse('2021-10-06'), 
    must_post_by: Date.parse('2021-10-04')
) #current, filter out by require_following_gender

cp10 = Campaign.create!(
    business_id:b5.id, 
    name:"Who doesn't want Donuts?", 
    image:"/img/campaign_image/cp7.png", 
    location_name:"The Donut Hole", 
    location_type:"restaurant", 
    address: "15300 Amar Rd", 
    city: "La Puente", 
    state: "CA", 
    zip:91744, 
    country: "US", 
    compensation_type:"Service", 
    compensation_market_value:10.00, 
    start_date:Date.parse('2021-09-11'), 
    end_date:Date.parse('2021-09-15'), 
    application_deadline: Date.parse('2021-09-05'), 
    require_following_minimum:2000, 
    require_following_location:"Los Angeles", 
    require_following_female_ratio:95, 
    require_gender:"Male", 
    require_others:"over 18", 
    description:"Come take some photos of our Donut Hole!", 
    content_sent_by:Date.parse('2021-10-06'), 
    must_post_by: Date.parse('2021-10-04')
) #current, filter out by require_following_female_ratio




puts "Seeding applications..."
a1 = Application.create!(campaign_id:cp1.id, content_creator_id:cc2.id, note:"")
a2 = Application.create!(campaign_id:cp1.id, content_creator_id:cc3.id, note:"")
a3 = Application.create!(campaign_id:cp1.id, content_creator_id:cc4.id, note:"")
a4 = Application.create!(campaign_id:cp1.id, content_creator_id:cc5.id, note:"")

a5 = Application.create!(campaign_id:cp2.id, content_creator_id:cc1.id, note:"")
a6 = Application.create!(campaign_id:cp2.id, content_creator_id:cc2.id, note:"")
a7 = Application.create!(campaign_id:cp2.id, content_creator_id:cc3.id, note:"")

a8 = Application.create!(campaign_id:cp3.id, content_creator_id:cc2.id, note:"")
a9 = Application.create!(campaign_id:cp3.id, content_creator_id:cc4.id, note:"")
a10 = Application.create!(campaign_id:cp3.id, content_creator_id:cc5.id, note:"")

a11 = Application.create!(campaign_id:cp6.id, content_creator_id:cc1.id, note:"")



puts "Seeding invitations..."
i1 = Invitation.create!(campaign_id:cp1.id, content_creator_id:cc1.id, note:"")
i2 = Invitation.create!(campaign_id:cp1.id, content_creator_id:cc2.id, note:"")
i3 = Invitation.create!(campaign_id:cp1.id, content_creator_id:cc5.id, note:"")

i4 = Invitation.create!(campaign_id:cp3.id, content_creator_id:cc1.id, note:"")
i5 = Invitation.create!(campaign_id:cp3.id, content_creator_id:cc3.id, note:"")

i6 = Invitation.create!(campaign_id:cp4.id, content_creator_id:cc1.id, note:"")
i7 = Invitation.create!(campaign_id:cp7.id, content_creator_id:cc1.id, note:"")


puts "Seeding referralServices..."
rs1 = ReferralService.create!(content_creator_id:cc1.id, campaign_id:cp4.id, employee_name:"Suey")
rs2 = ReferralService.create!(content_creator_id:cc2.id, campaign_id:cp4.id, employee_name:"")


puts "Seeding collabs..."
cl1 = Collab.create!(campaign_id:cp1.id, content_creator_id:cc1.id, note:"")

cl2 = Collab.create!(campaign_id:cp3.id, content_creator_id:cc1.id, note:"")
cl3 = Collab.create!(campaign_id:cp3.id, content_creator_id:cc3.id, note:"")

cl4 = Collab.create!(campaign_id:cp4.id, content_creator_id:cc1.id, note:"")
cl5 = Collab.create!(campaign_id:cp5.id, content_creator_id:cc1.id, note:"")

puts "Seeding reviews..."
r1 = Review.create!(
    reviewer_id: b1.id, 
    reviewer_type: "Business", 
    reviewee_id:cc1.id, 
    reviewee_type:"ContentCreator", 
    rating: 5, 
    content:"We worked with Leslie for our coffee party event, she is Amazing!"
)

r2 = Review.create!(
    reviewer_id: cc1.id, 
    reviewer_type: "ContentCreator", 
    reviewee_id:b1.id, 
    reviewee_type:"Business", 
    rating: 5, 
    content:"The staff of Alfred is soooooo frendly! I love the space and coffee! Looking forward to working with them again!"
)

r3 = Review.create!(
    reviewer_id: cc3.id, 
    reviewer_type: "ContentCreator", 
    reviewee_id:b1.id, 
    reviewee_type:"Business", 
    rating: 3, 
    content:"The space is OK, but the party was so crowded, I can barely take any nice looking photo! Hoping they can host better event next time."
)

r4 = Review.create!(
    reviewer_id: cc1.id, 
    reviewer_type: "ContentCreator", 
    reviewee_id:b2.id, 
    reviewee_type:"Business", 
    rating: 4.5, 
    content:"The flower wall in their store is GOLD! I guess why I only gave 4.5 is that sometimes their staff isn't too responsive when I reached out."
)

r5 = Review.create!(
    reviewer_id: b3.id, 
    reviewer_type: "Business", 
    reviewee_id:cc1.id, 
    reviewee_type:"ContentCreator", 
    rating: 5, 
    content:"Lesile is cool!"
)

puts "Seeding messages..."
m1 = Message.create!(writer_id:b1.id, writer_type:"Business", receiver_id:cc1.id, receiver_type:"ContentCreator", 
    read: true, content:"b1 to cc1 first msg")
m2 = Message.create!(writer_id:b1.id, writer_type:"Business", receiver_id:cc1.id, receiver_type:"ContentCreator",
    read: true, content:"b1 to cc1 2nd msg")
m3 = Message.create!(writer_id:cc1.id, writer_type:"ContentCreator", receiver_id:b1.id, receiver_type:"Business",
    read: true, content:"cc1 to b1 3rd msg")
m4 = Message.create!(writer_id:b1.id, writer_type:"Business", receiver_id:cc1.id, receiver_type:"ContentCreator",
    read: true, content:"b1 to cc1 4nd msg")
m5 = Message.create!(writer_id:b1.id, writer_type:"Business", receiver_id:cc2.id, receiver_type:"ContentCreator",
    read: true, content:"b1 to cc2 4nd msg")

puts "Seeding DMs..."
dm1 = DirectMessage.create!(writer_id:u1.id, receiver_id:u3.id, read: true, content:"u1 to u3 first msg")
dm2 = DirectMessage.create!(writer_id:u1.id, receiver_id:u3.id, read: true, content:"u1 to u3 2nd msg")
dm3 = DirectMessage.create!(writer_id:u3.id, receiver_id:u1.id, read: true, content:"u3 to u1 3rd msg")
dm4 = DirectMessage.create!(writer_id:u1.id, receiver_id:u3.id, read: true, content:"u1 to u3 4 msg")
dm5 = DirectMessage.create!(writer_id:u1.id, receiver_id:u4.id, read: true, content:"u1 to u4 4 msg")

puts "Seeding Notifications..."
# for applications
n1 = Notification.create!(user_id:u1.id, notification_reason_id:a1.id , notification_reason_type:"Application", content: "Application from cc2 to cp1", read:true)
n2 = Notification.create!(user_id:u1.id, notification_reason_id:a2.id  , notification_reason_type:"Application", content: "Application from cc3 to cp1", read:true)
n3 = Notification.create!(user_id:u1.id, notification_reason_id:a3.id  , notification_reason_type:"Application", content: "Application from cc4 to cp1", read:true)
n4 = Notification.create!(user_id:u1.id, notification_reason_id:a4.id  , notification_reason_type:"Application", content: "Application from cc5 to cp1", read:false)

n5 = Notification.create!(user_id:u1.id, notification_reason_id:a5.id  , notification_reason_type:"Application", content: "Application from cc1 to cp2", read:false)
n6 = Notification.create!(user_id:u1.id, notification_reason_id:a6.id  , notification_reason_type:"Application", content: "Application from cc2 to cp2", read:false)
n7 = Notification.create!(user_id:u1.id, notification_reason_id:a7.id  , notification_reason_type:"Application", content: "Application from cc3 to cp2", read:true)

n8 = Notification.create!(user_id:u1.id, notification_reason_id:a8.id  , notification_reason_type:"Application", content: "Application from cc2 to cp3", read:true)
n9 = Notification.create!(user_id:u1.id, notification_reason_id:a9.id  , notification_reason_type:"Application", content: "Application from cc4 to cp3", read:true)
n10 = Notification.create!(user_id:u1.id, notification_reason_id:a10.id  , notification_reason_type:"Application", content: "Application from cc5 to cp3", read:true)

n11 = Notification.create!(user_id:u6.id, notification_reason_id:a11.id  , notification_reason_type:"Application", content: "Application from cc1 to cp6", read:true)

#for invitations
n12 = Notification.create!(user_id:u3.id, notification_reason_id:i1.id  , notification_reason_type:"Invitation", content: "Invitation from cp1 to u3", read:true)
n13 = Notification.create!(user_id:u4.id, notification_reason_id:i2.id  , notification_reason_type:"Invitation", content: "Invitation from cp1 to u4", read:true)
n14 = Notification.create!(user_id:u10.id, notification_reason_id:i3.id  , notification_reason_type:"Invitation", content: "Invitation from cp1 to u10", read:true)

#for collabs
n15 = Notification.create!(user_id:u3.id, notification_reason_id:cl1.id  , notification_reason_type:"Collab", content: "Collab from cp1 to u3", read:true)

n16 = Notification.create!(user_id:u3.id, notification_reason_id:cl2.id  , notification_reason_type:"Collab", content: "Collab from cp3 to u3", read:false)
n17 = Notification.create!(user_id:u8.id, notification_reason_id:cl3.id  , notification_reason_type:"Collab", content: "Collab from cp3 to u8", read:false)

#for reviews
n18 = Notification.create!(user_id:u3.id, notification_reason_id:r1.id  , notification_reason_type:"Review", content: "Review from b1 to u3", read:true)
n19 = Notification.create!(user_id:u1.id, notification_reason_id:r2.id  , notification_reason_type:"Review", content: "Review from u3 to b1", read:true)


puts "🌱🌱🌱🌱Done!🌱🌱🌱🌱"

#brew services restart postgresql
