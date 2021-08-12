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


puts "Seeding businesss..."
b1 = Business.create!(username: "alfred_coffee", name: "Alfred Coffee", email: "info@alfred_coffee.com", password_digest: Business.digest('123'), business_type: "restaurant", address: "11908 San Vicente Blvd", city: "Los Angeles", state: "CA", zip:90049, country: "US", website: "https://alfred.la/", description: "We opened the doors to our first location, our Melrose Place cafe, in January of 2013. Over the ensuing months Alfred became a destination cafe known for its impeccable style, and a fixture of the Los Angeles food and beverage scene. We’ve labored hard to establish a loyal clientele, and attract attention from national newsmedia. As we continue to grow we strive to remain true to our ideals of providing delicious coffee, and unparalleled hospitality.",logo: "https://is5-ssl.mzstatic.com/image/thumb/Purple124/v4/06/1a/c1/061ac1c1-3345-fb2a-78e9-16826860ebbc/source/256x256bb.jpg")
b2 = Business.create!(username: "miss_lola", name: "Miss Lola", email: "info@miss_lola.com", password_digest: Business.digest('123'), business_type: "retail", address: "8350 Rex Rd Unit B", city: "Pico Rivera", state: "CA", zip:90660, country: "US", website: "https://www.misslola.com/", description: "If you love shoes, you love Miss LOLA",logo: "https://pbs.twimg.com/profile_images/1024708986010910721/QTotDXnZ_400x400.jpg")

puts "Seeding contentCreators..."
cc1 = ContentCreator.create!(username:"my_adorkable_adventures",email:"my_adorkable_adventures@gmail.com", first_name:"Leslie", last_name:"Doe", password_digest:ContentCreator.digest('123'),gender:"female", instagram_username: "@my_adorkable_adventures", instagram_url:"https://www.instagram.com/my_adorkable_adventures/", instagram_follower: 11600, instagram_female_follower_ratio:70, instagram_top1_follow_location:"Los Angeles", instagram_connection_permission: true, ave_rate_per_campaign: 10, paypal_account: "my_adorkable_adventures@gmail.com", profile_pic:"https://cdn.shopify.com/s/files/1/0511/5533/files/Screen_Shot_2021-08-05_at_4.09.03_PM_1110x.png?v=1628205051", website:"https://adorkableadventures.com/")
cc2 = ContentCreator.create!(username:"angela_losangeleslife",email:"angela_losangeleslife@gmail.com", first_name:"Leslie", last_name:"Doe", password_digest:ContentCreator.digest('123'),gender:"female", instagram_username: "@my_adorkable_adventures", instagram_url:"https://www.instagram.com/my_adorkable_adventures/", instagram_follower: 11600, instagram_female_follower_ratio:70, instagram_top1_follow_location:"Los Angeles", instagram_connection_permission: true, ave_rate_per_campaign: 10, paypal_account: "my_adorkable_adventures@gmail.com", profile_pic:"https://cdn.shopify.com/s/files/1/0511/5533/files/Screen_Shot_2021-08-05_at_4.09.03_PM_1110x.png?v=1628205051", website:"https://adorkableadventures.com/")

puts "Seeding campaigns..."
cp1 = Campaign.create!(business_id:b1.id, name:"Coffee First", image:"", location_name:"", location_type:"", address:"", city:"", state:"", zip:"", country:"", compensation_type:"", compensation_market_value:"", start_date:Date.parse('2021-09-01'), end_date:Date.parse('2021-09-20'), application_deadline: Date.parse('2021-08-20'), require_following_minimum:0, require_following_location:"Los Angeles", require_following_female_ratio:0, require_gender:"", require_others:"", description:"", content_sent_by:Date.parse('2021-10-1'), must_post_by: Date.parse('2021-10-10'))
cp2 = Campaign.create!(business_id:b1.id, name:"Coffee Second", image:"", location_name:"", location_type:"", address:"", city:"", state:"", zip:"", country:"", compensation_type:"", compensation_market_value:"", start_date:Date.parse('2021-09-01'), end_date:Date.parse('2021-09-20'), application_deadline: Date.parse('2021-08-20'), require_following_minimum:0, require_following_location:"Los Angeles", require_following_female_ratio:0, require_gender:"", require_others:"", description:"", content_sent_by:Date.parse('2021-10-1'), must_post_by: Date.parse('2021-10-10'))
cp3 = Campaign.create!(business_id:b1.id, name:"Coffee Third", image:"", location_name:"", location_type:"", address:"", city:"", state:"", zip:"", country:"", compensation_type:"", compensation_market_value:"", start_date:Date.parse('2021-09-01'), end_date:Date.parse('2021-09-20'), application_deadline: Date.parse('2021-08-20'), require_following_minimum:0, require_following_location:"Los Angeles", require_following_female_ratio:0, require_gender:"", require_others:"", description:"", content_sent_by:Date.parse('2021-10-1'), must_post_by: Date.parse('2021-10-10'))
cp4 = Campaign.create!(business_id:b2.id, name:"Shoeeeeeee", image:"", location_name:"", location_type:"", address:"", city:"", state:"", zip:"", country:"", compensation_type:"", compensation_market_value:"", start_date:Date.parse('2021-09-01'), end_date:Date.parse('2021-09-20'), application_deadline: Date.parse('2021-08-20'), require_following_minimum:0, require_following_location:"Los Angeles", require_following_female_ratio:0, require_gender:"", require_others:"", description:"", content_sent_by:Date.parse('2021-10-1'), must_post_by: Date.parse('2021-10-10'))


puts "Seeding applications..."
a1 = Application.create!(content_creator_id:cc1.id, campaign_id:cp1.id, note:"")
a2 = Application.create!(content_creator_id:cc1.id, campaign_id:cp2.id, note:"")
a3 = Application.create!(content_creator_id:cc2.id, campaign_id:cp1.id, note:"")
a4 = Application.create!(content_creator_id:cc2.id, campaign_id:cp3.id, note:"")
a5 = Application.create!(content_creator_id:cc2.id, campaign_id:cp4.id, note:"")

puts "Seeding invitations..."
i1 = Invitation.create!(content_creator_id:cc1.id, campaign_id:cp1.id, note:"")
i2 = Invitation.create!(content_creator_id:cc2.id, campaign_id:cp1.id, note:"")
i3 = Invitation.create!(content_creator_id:cc2.id, campaign_id:cp2.id, note:"")

puts "Seeding referralServices..."
rs1 = ReferralService.create!(content_creator_id:cc1.id, campaign_id:cp4.id, employee_name:"Suey")
rs2 = ReferralService.create!(content_creator_id:cc2.id, campaign_id:cp4.id, employee_name:"")


puts "Seeding collabs..."
cl1 = Collab.create!(content_creator_id:cc1.id, campaign_id:cp1.id, note:"")
cl2 = Collab.create!(content_creator_id:cc2.id, campaign_id:cp1.id, note:"")

puts "Seeding reviews..."
r1 = Review.create!(reviewee_id:cc1.id, reviewee_type:"ContentCreator", reviewer_id:b1.id, reviewer_type:"Business")
r2 = Review.create!(reviewee_id:cc2.id, reviewee_type:"ContentCreator", reviewer_id:b1.id, reviewer_type:"Business")
r3 = Review.create!(reviewee_id:b1.id, reviewee_type:"Business", reviewer_id:cc1.id, reviewer_type:"ContentCreator")
r4 = Review.create!(reviewee_id:b1.id, reviewee_type:"Business", reviewer_id:cc2.id, reviewer_type:"ContentCreator")
r5 = Review.create!(reviewee_id:b2.id, reviewee_type:"Business", reviewer_id:cc1.id, reviewer_type:"ContentCreator")

puts "Seeding messages..."
m1 = Message.create!(writer_id:b1.id, writer_type:"Business", receiver_id:cc1.id, receiver_type:"ContentCreator")
m2 = Message.create!(writer_id:cc1.id, writer_type:"ContentCreator", receiver_id:b2.id, receiver_type:"Business")

puts "🌱🌱🌱🌱Done!🌱🌱🌱🌱"

