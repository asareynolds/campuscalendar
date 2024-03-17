import requests

events = [
  {   
    "event_starttime": 1716810000, 
    "event_endtime": 1716896400,  
    "event_name": "Research Experiences for Undergraduates (REU) Monthly Virtual Information Sessions",
    "event_description": "Learn about research opportunities for undergraduate students in the College of Engineering. All engineering majors welcome.",
    "event_url": "https://www.engr.psu.edu/events/event-detail.aspx?EventID=808e1f41-eb2d-4ce1-b18c-b",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "3ecdd04d-5aad-4c4f-9c85-d453cc79f720",
    "type": "official"
  },
  {  
    "event_starttime": 1719568800, 
    "event_endtime": 1719574800, 
    "event_name": "CareerPREP: Finding YOUR Career Path",
    "event_description": "220 Hammond Building 6:00–7:00 p.m. Are you feeling unsure about what career path to take? ...",
    "event_url": "https://www.engr.psu.edu/events/event-detail.aspx?EventID=b661a1d2-742b-40c6-bce5-3",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "3ecdd04d-5aad-4c4f-9c85-d453cc79f720",
    "type": "official"
  },
  {   
    "event_starttime": 1719583200, 
    "event_endtime": 1719592800, 
    "event_name": "Commonwealth of Pennsylvania Recruiting Day",
    "event_description": "Kunkle Lounge 10:00 a.m.–2:00 p.m. Stop by and talk to recruiters about job opportunities for engineering students and graduates....",
    "event_url": "https://www.engr.psu.edu/events/event-detail.aspx?EventID=3aa2b306-fb38-4369-9d2a-a",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "3ecdd04d-5aad-4c4f-9c85-d453cc79f720",
    "type": "official"
  },
  {  
    "event_starttime": 1719576000, 
    "event_endtime": 1719580800, 
    "event_name": "CSE Colloquium: Pan-genomic advances for fighting reference bias",
    "event_description": "Westgate W375 2:00 - 3:00 p.m.",
    "event_url": "https://www.engr.psu.edu/events/event-detail.aspx?EventID=a5f483e8-3551-4048-a47c-7",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "3ecdd04d-5aad-4c4f-9c85-d453cc79f720",
    "type": "official"
  },
  {
    "event_starttime": 1719662400, 
    "event_endtime": 1719666000,
    "event_name": "Pratt & Whitney Information Session—CANCELLED",
    "event_description": "Gursahaney Family E-Knowledge Commons, Reber Building 12:00 noon–1:00 p.m.",
    "event_url": "https://www.engr.psu.edu/events/event-detail.aspx?EventID=e764b869-dd35-436f-85e7-6",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "3ecdd04d-5aad-4c4f-9c85-d453cc79f720",
    "type": "official"
  },
  {   
    "event_starttime": 1719669600, 
    "event_endtime": 1719676800, 
    "event_name": "Spring 2024 Supply Chain & Information Systems Department (SCIS) Virtual Career Fair",
    "event_description": "Virtual 3:00–6:00 p.m. (ET) This virtual event is open to all IE and supply chain majors.",
    "event_url": "https://www.engr.psu.edu/events/event-detail.aspx?EventID=e07145f3-a17c-4f7d-b097-9",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "3ecdd04d-5aad-4c4f-9c85-d453cc79f720",
    "type": "official"
  },
  {   
    "event_starttime": 1719752400, 
    "event_endtime": 1719757800, 
    "event_name": "Deloitte DE&I Panel: Discussions in Diversity, Equity & Inclusion",
    "event_description": "214 Business Building 5:45–6:30 p.m. All interested students are invited to participate in this interactive panel discussion... ",
    "event_url": "https://www.engr.psu.edu/events/event-detail.aspx?EventID=3975d167-e0d0-459f-9146-3",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "3ecdd04d-5aad-4c4f-9c85-d453cc79f720",
    "type": "official"
  },
  {  
    "event_starttime": 1719748800, 
    "event_endtime": 1719759600, 
    "event_name": "Deloitte Takeover Day",
    "event_description": "Kunkle Lounge 10:00 a.m.–3:00 p.m. Stop by and talk to recruiters about career opportunities at Deloitte! ...",
    "event_url": "https://www.engr.psu.edu/events/event-detail.aspx?EventID=d702727f-adc9-4c78-b871-1",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "3ecdd04d-5aad-4c4f-9c85-d453cc79f720",
    "type": "official"
  },
  { 
    "event_starttime": 1719756000, 
    "event_endtime": 1719759600, 
    "event_name": "Integrating Hydrologic Modeling and Field Data with Local Knowledge Holders",
    "event_description": "Virtual Session 11:00 a.m. (ET)",
    "event_url": "https://www.engr.psu.edu/events/event-detail.aspx?EventID=5bf538d8-5c16-429f-96ef-5",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "3ecdd04d-5aad-4c4f-9c85-d453cc79f720",
    "type": "official"
  },
  {
    "event_starttime": 1720357200, 
    "event_endtime": 1720360800, 
    "event_name": "Accenture Gaming League",
    "event_description": "Sign up with a team of up to 5 friends to play in a gaming tournament... ",
    "event_url": "https://www.engr.psu.edu/events/event-detail.aspx?EventID=00bc6c0f-d5d2-472f-b267-4",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "3ecdd04d-5aad-4c4f-9c85-d453cc79f720",
    "type": "official"
  },
  {
"event_starttime": 1720396800,
"event_endtime": 1720400400,
"event_name": "Faculty Speaker Series: Clinical Improvement Project (ClIP)",
"event_description": "Introduction to the Clinical Improvement Project (ClIP). Event objectives are to recognize the importance of promoting clinical judgment among nursing students and describe the clinical improvement project implementation.",
"event_url": "https://www.nursing.psu.edu/event/faculty-speaker-series-clinical-improvement-process-clip/",
"event_org": "05ca1072-5cfa-478f-b4a3-00f8899f1dbe",
"type": "official"
},
{
"event_starttime": 1724150400, 
"event_endtime": 1728198399,
"event_name": "Simulation Development for Healthcare Educators",
"event_description": "This dynamic two-part professional development opportunity for higher education and hospital-based healthcare educators delivered in a hybrid format. The in-person session will be held in the Nursing Sciences Building at University Park in the Simulation Laboratory.",
"event_url": "https://www.nursing.psu.edu/event/simulation-development-for-healthcare-educators-2/",
"event_org": "05ca1072-5cfa-478f-b4a3-00f8899f1dbe",
"type": "official"
},
{
"event_starttime": 1724505600, 
"event_endtime": 1724516400,
"event_name": "11th Annual CGNE Alumni & Friends Spring Brunch",
"event_description": "Celebrate, Learn, Connect! Join the Tressa Nese and Helen Diskevich Center of Geriatric Nursing Excellence (CGNE) to ...",
"event_url": "https://www.nursing.psu.edu/event/11th-annual-cgne-alumni-friends-spring-brunch/",
"event_org": "05ca1072-5cfa-478f-b4a3-00f8899f1dbe",
"type": "official"
},
{
"event_starttime": 1724937600,
"event_endtime": 1724941200,
"event_name": "Enhancing Care for Older Adults Living in Corrections",
"event_description": "CGNE Seminar Series – Spring 2024. Presented by Dr. Erin Kitt-Lewis, Associate Research Professor, Penn State Ross and Carol Nese College of Nursing. All seminars are free and hosted virtually unless indicated.",
"event_url": "https://www.nursing.psu.edu/event/enhancing-care-for-older-adults-living-in-corrections/",
"event_org": "05ca1072-5cfa-478f-b4a3-00f8899f1dbe",
"type": "official"
},
{
"event_starttime": 1726185600, 
"event_endtime": 1726189200,
"event_name": "Evaluation in Simulation: Using Data for Quality Improvement and Curriculum Development",
"event_description": "Join us for a free webinar designed to identify three ways to use simulation evaluation data for quality improvement and competency-based evaluation...",
"event_url": "https://www.nursing.psu.edu/event/evaluation-in-simulation-using-data-for-quality-improvement-and-curriculum-development/",
"event_org": "05ca1072-5cfa-478f-b4a3-00f8899f1dbe",
"type": "official"
},
{
"event_starttime": 1726272000,
"event_endtime": 1726275600,
"event_name": "Huddle Implementation in a Long-Term Care Facility: A Quality Improvement Project",
"event_description": "CGNE Seminar Series – Spring 2024. Presented by Tracy L. Kephart, D.N.P. Graduate Student,...",
"event_url": "https://www.nursing.psu.edu/event/huddle-implementation-in-a-long-term-care-facility-a-quality-improvement-project/",
"event_org": "05ca1072-5cfa-478f-b4a3-00f8899f1dbe",
"type": "official"
},
{
        "event_starttime": 1679174400,  
        "event_endtime": 1679185200,   
        "event_name": "DTO - An I.T. Career in the Foreign Service info session",
        "event_description": "Join us for a Zoom information session about the Diplomatic Technology Officer (DTO) role, an IT Career in the Foreign Service.",
        "event_url": "https://ist.psu.edu/events/dto-it-foreign-service-info-session-mar-18",
        "event_org": "2085ee57-3143-4aba-a348-873c8e8c80dd",
        "type": "official"
    },
    {
        "event_starttime": 1679260800, 
        "event_endtime": 1679264400,   
        "event_name": "IT Opportunities at the U.S. Department of State",
        "event_description": "Join U.S. Department of State's Diplomat in Residence for New England Michelle Kayser on March 19th at 12:00-1:00pm ET for a virtual panel discussion with U.S. Department of State IT Professionals to learn about the many IT opportunities with the U.S. Department of State.",
        "event_url": "https://ist.psu.edu/events/dos-it-opportunities-virtual-panel-mar-19",
        "event_org": "2085ee57-3143-4aba-a348-873c8e8c80dd",
        "type": "official"
    },
    {
        "event_starttime": 1679282400,  
        "event_endtime": 1679293200,   
        "event_name": "Bardusch Family IdeaMakers Challenge - Final Pitches (Penn State Startup Week)",
        "event_description": "Watch student teams present their final pitches in the Bardusch Family IdeaMakers Challenge, a 1.5-month, University-wide pitch competition where teams of undergraduate students present early-stage business ideas that identify an important problem that can be solved with digital innovation.",
        "event_url": "https://ist.psu.edu/events/ideamakers-final",
        "event_org": "2085ee57-3143-4aba-a348-873c8e8c80dd",
        "type": "official"
    },
    {
        "event_starttime": 1679347200,  
        "event_endtime": 1679358000,   
        "event_name": "IST Just Hired Event",
        "event_description": "Pop by to celebrate your offer and share with IST where you will be working this summer! Come pick up some popcorn and free swag.",
        "event_url": "https://ist.psu.edu/events/just-hired-mar-20",
        "event_org": "2085ee57-3143-4aba-a348-873c8e8c80dd",
        "type": "official"
    },
    {
        "event_starttime": 1679350800, 
        "event_endtime": 1679352600,   
        "event_name": "Entrepreneurship in Motion | Penn State Startup Week",
        "event_description": "Join students in the Entrepreneurship and Innovation minor to discover entrepreneurial concepts through motion. The interactive session requires no special knowledge, training, or skills . . . only the willingness to play. This brief and energizing Startup Week event is like no other! Pre-registration is suggested, as space is limited.",
        "event_url": "https://ist.psu.edu/events/entrepreneurship-in-motion",
        "event_org": "2085ee57-3143-4aba-a348-873c8e8c80dd",
        "type": "official"
    },
    {   
        "event_starttime": 1679372400,  
        "event_endtime": 1679376000,   
        "event_name": "Ahead of the Game: Internships with DICK’S Sporting Goods",
        "event_description": "DICK’S is inviting first-year and sophomore students to join us for a virtual event where you’ll have the chance to learn more about DSG, our recruitment process, hear from former interns and much more! ",
        "event_url": "https://ist.psu.edu/events/dicks-sporting-goods-info-session-mar-20",
        "event_org": "2085ee57-3143-4aba-a348-873c8e8c80dd",
        "type": "official"
    },
    {
        "event_starttime": 1679458800,  
        "event_endtime": 1679458800,    
        "event_name": "Startup Week Decoding Challenge: Submission Deadline",
        "event_description": "Organized by students in the Entrepreneurship and Innovation minor, the Startup Week Decoding Challenge prompts you to decode a secret message about innovative entrepreneurship. All correct entries will be entered into a raffle for a swag prize pack from Penn State Startup Week and the College of IST.",
        "event_url": "https://ist.psu.edu/events/decoding-challenge",
        "event_org": "2085ee57-3143-4aba-a348-873c8e8c80dd",
        "type": "official"
    },
    {  
        "event_starttime": 1679545200, 
        "event_endtime": 1679548800, 
        "event_name": "Virtual Lunch and Learn with Alumni | Penn State Startup Week",
        "event_description": "Organized by students in the Entrepreneurship and Innovation Minor, the Virtual Lunch and Learn with Alumni invites all Penn State alumni to participate in this online event. Alumni will learn from students about the conversational competencies that set apart the best innovative entrepreneurial teams from the rest.",
        "event_url": "https://ist.psu.edu/events/startup-week-lunch-learn",
        "event_org": "2085ee57-3143-4aba-a348-873c8e8c80dd",
        "type": "official"
    },
    {  
        "event_starttime": 1679798400,  
        "event_endtime": 1679805600, 
        "event_name": "Budgeting 1.0: Creating a Plan, a PNC Student Banking Webinar",
        "event_description": "Learn skills that will help you manage money and improve your overall understanding of how to achieve and maintain financial health.",
        "event_url": "https://ist.psu.edu/events/budgeting-pnc-webinar-mar-26",
        "event_org": "2085ee57-3143-4aba-a348-873c8e8c80dd",
        "type": "official"
    },
    { 
        "event_starttime": 1679833200,   
        "event_endtime": 1679851200,  
        "event_name": "In-Person & Virtual IST Career Coaching Drop-Ins",
        "event_description": "In-person and virtual drop-in career coaching appointments for the academic year will be held every Wednesday. These sessions, capped at 10 minutes in length, are available for quick questions and are not meant for long-term planning.",
        "event_url": "https://ist.psu.edu/events/career-drop-ins-mar-27",
        "event_org": "2085ee57-3143-4aba-a348-873c8e8c80dd",
        "type": "official"
    },
    {  
        "event_starttime": 1679919600, 
        "event_endtime": 1679923200, 
        "event_name": "IST Identity Talk - Women in Tech: Know Your Worth",
        "event_description": "Meet College of IST alumnae in this panel discussion about knowing your worth and preventing imposter syndrome from impacting your career and professional growth.",
        "event_url": "https://ist.psu.edu/events/identity-talks-women-in-tech",
        "event_org": "2085ee57-3143-4aba-a348-873c8e8c80dd",
        "type": "official"
    },
	{
        "event_starttime": 1679556000,  
        "event_endtime":   1679563200,   
        "event_name": "Jeff Dunham: Still Not Canceled",
        "event_description": "Bryce Jordan Center Event: Tickets Available",  
        "event_url": "https://bjc.psu.edu/jeff-dunham-1",
        "event_org": "ef437631-2726-42b3-8da0-14a8c77c80b9",
        "type": "official" 
    },
    {
        "event_starttime": 1680410400,  
        "event_endtime":  1680417600,   
        "event_name": "Drake, Lil Wayne, & Lil Durk: It's All A Blur Tour",
        "event_description": "Bryce Jordan Center Event: Tickets Available", 
        "event_url": "https://bjc.psu.edu/drake-lil-wayne-lil-durk",
        "event_org": "ef437631-2726-42b3-8da0-14a8c77c80b9",
        "type": "official" 
    },
    {
        "event_starttime": 1682761200,  
        "event_endtime": 1682768400, 
        "event_name": "THON 2024 Closer to a Cure Celebration",
        "event_description": "Bryce Jordan Center Event: Tickets Available",  
        "event_url": "https://bjc.psu.edu/thon-2024-closer-cure-celebration",
        "event_org": "ef437631-2726-42b3-8da0-14a8c77c80b9",
        "type": "official" 
    },
    {
        "event_starttime": 1683366000, 
        "event_endtime": 1683373200,   
        "event_name": "Hot Wheels Monster Trucks Live Glow Party",
        "event_description": "Bryce Jordan Center Event: Tickets Available", 
        "event_url": "https://bjc.psu.edu/hot-wheels-monster-trucks-live-glow-party-1",
        "event_org": "ef437631-2726-42b3-8da0-14a8c77c80b9",
        "type": "official" 
    },
    {
        "event_starttime": 1684143600, 
        "event_endtime":  1684150800,    
        "event_name": "The Price Is Right Live",
        "event_description": "Bryce Jordan Center Event: Tickets Available", 
        "event_url": "https://bjc.psu.edu/price-right-live-0",
        "event_org": "ef437631-2726-42b3-8da0-14a8c77c80b9",
        "type": "official" 
    },
    {
        "event_starttime": 1684662000, 
        "event_endtime":  1684748400,  
        "event_name": "U.S. Olympic Team Trials - Wrestling",
        "event_description": "Bryce Jordan Center Event: Tickets Available", 
        "event_url": "https://bjc.psu.edu/us-olympic-team-trials-wrestling-0",
        "event_org": "ef437631-2726-42b3-8da0-14a8c77c80b9",
        "type": "official" 
    },
    {
        "event_starttime": 1685702400, 
        "event_endtime":  1685899200,   
        "event_name": "Penn State Spring Commencement 2024",
        "event_description": "Bryce Jordan Center Event: No Tickets Required", 
        "event_url": "https://www.commencement.psu.edu/schedule/",
        "event_org": "ef437631-2726-42b3-8da0-14a8c77c80b9",
        "type": "official" 
    },
    {
        "event_starttime": 1686654000, 
        "event_endtime":  1686661200,    
        "event_name": "Supplier Diversity Trade Fair",
        "event_description": "Bryce Jordan Center Event: No Tickets Required", 
        "event_url": "https://bjc.psu.edu/supplier-diversity-trade-fair",
        "event_org": "ef437631-2726-42b3-8da0-14a8c77c80b9",
        "type": "official" 
    },
    { 
        "event_starttime":  1690983600,
        "event_endtime":  1690990800,
        "event_name": "Billy Strings: Summer Tour '24",
        "event_description": "Bryce Jordan Center Event: Tickets Available", 
        "event_url": "https://bjc.psu.edu/billy-strings",
        "event_org": "ef437631-2726-42b3-8da0-14a8c77c80b9",
        "type": "official" 
    },
    { 
        "event_starttime":  1691070000, 
        "event_endtime":  1691077200,   
        "event_name": "Billy Strings: Summer Tour '24",
        "event_description": "Bryce Jordan Center Event: Tickets Available", 
        "event_url": "https://bjc.psu.edu/billy-strings-0",
        "event_org": "ef437631-2726-42b3-8da0-14a8c77c80b9",
        "type": "official" 
    },
    { 
        "event_starttime":  1693578000, 
        "event_endtime":  1693585200,   
        "event_name": "Kacey Musgraves",
        "event_description": "Bryce Jordan Center Event: Tickets Available", 
        "event_url": "https://bjc.psu.edu/kacey-musgraves",
        "event_org": "ef437631-2726-42b3-8da0-14a8c77c80b9",
        "type": "official" 
    },
    { 
        "event_starttime":  1696002000, 
        "event_endtime": 1696009200,   
        "event_name": "Jelly Roll: Beautifully Broken Tour",
        "event_description": "Bryce Jordan Center Event: Tickets Available", 
        "event_url": "https://bjc.psu.edu/jelly-roll",
        "event_org": "ef437631-2726-42b3-8da0-14a8c77c80b9",
        "type": "official" 
    },
	{
    "event_starttime": 1676745600,
    "event_endtime": 1677440400,
    "event_name": "Strengthening Families Program 10-14",
    "event_description": "The Youth Service Bureau is offering the Strengthening Families Program 10-14... Click Here to Register. Location: 325 West Aaron Drive, State College, PA 16803",
    "event_url": "https://www.statecollege.com/event/strengthening-families-program-10-14/2024-02-06/",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "010982d6-fe27-4da4-adf4-3d3406235a0c",
    "type": "official"
  },
  {
    "event_starttime": 1676835600,
    "event_endtime": 1677440400,
    "event_name": "Crafts to Go! Hedgehogs",
    "event_description": "These hedgehogs will make you smile... Call to Register: 814-237-6236. Location: Schlow Centre Region Library, 211 South Allen Street, State College, PA 16801",
    "event_url": "https://www.statecollege.com/event/crafts-to-go-hedgehogs/2024-02-16/",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "010982d6-fe27-4da4-adf4-3d3406235a0c",
    "type": "official"
  },
  {
    "event_starttime": 1677699000,
    "event_endtime": 1678388400,
    "event_name": "Abstract Art at the Gallery Shop in Lemont",
    "event_description": "March ...Feb 27 to March 30. Our March atrium show will feature fascinating abstract art... Location: Gallery Shop, 824 Pike St, Lemont, PA 16851",
    "event_url": "https://www.statecollege.com/event/abstract-art-at-the-gallery-shop-in-lemont-2/",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "010982d6-fe27-4da4-adf4-3d3406235a0c",
    "type": "official"
  },
  {
    "event_starttime": 1677993600,
    "event_endtime": 1677993600,
    "event_name": "STEM Craft Club",
    "event_description": "STEM Craft Club. Best for ages 3-7. Members Season Pass $25 | Non-members Season Pass $40 | Drop in $5... Location: Discovery Space, 1224 N Atherton St, State College, PA 16803",
    "event_url": "https://www.statecollege.com/event/stem-craft-club/2024-03-16/",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "010982d6-fe27-4da4-adf4-3d3406235a0c",
    "type": "official"
  },
  {
    "event_starttime": 1677993600,
    "event_endtime": 1678029600,
    "event_name": "For the LOVE of Fiber",
    "event_description": "For the LOVE of Fiber at the Ramada Inn and Conference Center... 10:00 am - 5:00 pm. Spend the day with us! Free Admission. Location: Ramada Inn, 1450 S Atherton St, State College, PA 16801",
    "event_url": "https://www.statecollege.com/event/for-the-love-of-fiber/",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "010982d6-fe27-4da4-adf4-3d3406235a0c",
    "type": "official"
  },
  {
    "event_starttime": 1678036800,
    "event_endtime": 1678036800,
    "event_name": "Hollywood Nights – The Bob Seger Experience",
    "event_description": "Hollywood Nights – The Bob Seger Experience is the ultimate tribute... Represent the voice of every fan... Location: State Theatre, 130 West College Avenue, State College, PA 16802",
    "event_url": "https://www.statecollege.com/event/hollywood-nights-the-bob-seger-experience/",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "010982d6-fe27-4da4-adf4-3d3406235a0c",
    "type": "official"
  },
  {
    "event_starttime": 1678058400,
    "event_endtime": 1678065600,
    "event_name": "3rd Sunday Ukulele Jam",
    "event_description": "Join us for an all-ages, all-skills, 2-hour ukulele jam!... Location: Nittany Mall Community Room, 2901 East College Avenue, State College, PA 16801",
    "event_url": "https://www.statecollege.com/event/3rd-sunday-ukulele-jam/2024-03-17/",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "010982d6-fe27-4da4-adf4-3d3406235a0c",
    "type": "official"
  },
  {
    "event_starttime": 1678058400,
    "event_endtime": 1678069200,
    "event_name": "Eggstravaganza--Easter Egg Hunt!",
    "event_description": "Join us for an egg-cellent time... Children ages 4-8 are invited... Location: Barnes & Noble, 365 Benner Pike, State College, PA 16801",
    "event_url": "https://www.statecollege.com/event/eggstravaganza-easter-egg-hunt/",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "010982d6-fe27-4da4-adf4-3d3406235a0c",
    "type": "official"
  },
  {
    "event_starttime": 1678061400,
    "event_endtime": 1678063800,
    "event_name": "The Waggle Dance STEM Program",
    "event_description": "Young scientists will learn about the importance of... Limit: 30. Location: Schlow Centre Region Library, 211 South Allen Street, State College, PA 16801",
    "event_url": "https://www.statecollege.com/event/the-waggle-dance-stem-program/",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "010982d6-fe27-4da4-adf4-3d3406235a0c",
    "type": "official"
  },
  {
    "event_starttime": 1678065000,
    "event_endtime": 1678069800,
    "event_name": "State College Municipal Band March to the Movies Concert",
    "event_description": "Please join us at the next State College Municipal Band Concert... Location: Mount Nittany Middle School, 656 Brandywine Drive, State College, PA 16801",
    "event_url": "https://www.statecollege.com/event/state-college-municipal-band-march-to-the-movies-concert/",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "010982d6-fe27-4da4-adf4-3d3406235a0c",
    "type": "official"
  },
    {
    "event_starttime": 1678061400,
    "event_endtime": 1678063800,
    "event_name": "The Waggle Dance STEM Program",
    "event_description": "Young scientists will learn about the importance of dance in science. Location: Schlow Centre Region Library, 211 South Allen Street, State College, PA 16801",
    "event_url": "https://www.statecollege.com/event/the-waggle-dance-stem-program/",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "06779d81-5b9e-4a5d-ae70-c1b37b1b69ac",
    "type": "official"
  },
  {
    "event_starttime": 1678750200, 
    "event_endtime": 1678755600, 
    "event_name": "Nowruz",
    "event_description": "Nowruz, also spelled as \"Norooz\" or \"Nawruz\", is the Persian New Year and the traditional festival of spring that marks the first day of the Iranian calendar... Location: Alumni Hall",
    "event_url": "https://orgcentral.psu.edu/event/9672918",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "06779d81-5b9e-4a5d-ae70-c1b37b1b69ac",
    "type": "official"
  },
  {
    "event_starttime": 1678759200,
    "event_endtime": 1678764600, 
    "event_name": "Play On!",
    "event_description": "\n\nNo Refund Theatre presents the fifth show of their Spring 2024 semester lineup, \"Play On!\", directed by Katherine Schreiner!!...\n\n Location: Forum 111", 
    "event_url": "https://orgcentral.psu.edu/event/9731528",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "06779d81-5b9e-4a5d-ae70-c1b37b1b69ac",
    "type": "official"
  },
  {
    "event_starttime": 1678845600, 
    "event_endtime": 1678851000, 
    "event_name": "Nowruz", 
    "event_description": "Welcome to the Nowruz 1403 Celebration at State College!... Location: Penn State University, State College", 
    "event_url": "https://orgcentral.psu.edu/event/10007105",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "06779d81-5b9e-4a5d-ae70-c1b37b1b69ac",
    "type": "official"
  },
  {
    "event_starttime": 1678935000,
    "event_endtime": 1678947600,
    "event_name": "Hershey",
    "event_description": "Hershey Visit\n\n Location: Keeney Commons", 
    "event_url": "https://orgcentral.psu.edu/event/9889749",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "06779d81-5b9e-4a5d-ae70-c1b37b1b69ac",
    "type": "official"
  },
  {
    "event_starttime": 1678941000,
    "event_endtime": 1678948200,
    "event_name": "Food Science in Action 2024",
    "event_description": "On March 18th 2024 the Penn State chapter of Phi Tau Sigma will be hosting Food Science in action!... Location: 252 Food Science Building",
    "event_url": "https://orgcentral.psu.edu/event/9355761",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "06779d81-5b9e-4a5d-ae70-c1b37b1b69ac",
    "type": "official"
  },
  {
    "event_starttime": 1678941000,
    "event_endtime": 1678948200,
    "event_name": "Food Science in Action 2024",
    "event_description": "On March 18th 2024 the Penn State chapter of Phi Tau Sigma will be hosting Food Science in action!... Location: 252 Food Science Building",
    "event_url": "https://orgcentral.psu.edu/event/9355762",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "06779d81-5b9e-4a5d-ae70-c1b37b1b69ac",
    "type": "official"
  },
  {
    "event_starttime": 1678953900, 
    "event_endtime": 1678957500, 
    "event_name": "ARHS Weekly General Body Meeting",
    "event_description": "Greetings Nittany Lions!... Location: Redifer PDR", 
    "event_url": "https://orgcentral.psu.edu/event/9788678",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "06779d81-5b9e-4a5d-ae70-c1b37b1b69ac",
    "type": "official"
  },
  {
    "event_starttime": 1679036400, 
    "event_endtime": 1679050800, 
    "event_name": "Peanut Butter Express",
    "event_description": "~CHOO CHOO~\nThe Bethune Society is collecting donations of peanut butter... Location: HUB-Robeson Center", 
    "event_url": "https://orgcentral.psu.edu/event/9926462",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "06779d81-5b9e-4a5d-ae70-c1b37b1b69ac",
    "type": "official"
  },
   {
    "event_starttime": 1679047800,
    "event_endtime": 1679063400,
    "event_name": "QTPOC Mixer",
    "event_description": "Join the Paul Robeson Cultural Center and the Center for Sexual and Gender Diversity for a collaborative mixer...  Location: PRCC & CSGD",
    "event_url": "https://orgcentral.psu.edu/event/10008922",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "06779d81-5b9e-4a5d-ae70-c1b37b1b69ac",
    "type": "official"
  },
  {
    "event_starttime": 1679054400,
    "event_endtime": 1679058000,
    "event_name": "Chanoyu Omotosenke Event 03/19",
    "event_description": "Japanese Tea ceremony is very intricate and detail oriented... Location: 34 Ritenour",
    "event_url": "https://orgcentral.psu.edu/event/9541813",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "06779d81-5b9e-4a5d-ae70-c1b37b1b69ac",
    "type": "official"
  },
  { 
    "event_starttime": 1679058600,
    "event_endtime": 1679070600,
    "event_name": "CSF Impact Gathering",
    "event_description": "Join us for an uplifting evening of fellowship... Location: Memorial Lounge",
    "event_url": "https://orgcentral.psu.edu/event/9861447",
    "event_university":  "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
    "event_org": "06779d81-5b9e-4a5d-ae70-c1b37b1b69ac",
    "type": "official"
  }
]

api_url = "https://api.campuscal.tech/event/create"

for event in events:
    response = requests.post(api_url, json=event)
    if response.status_code == 200:
        print("Event created successfully:", event["event_name"])
    else:
        print("Failed to create event:", event["event_name"], "Error:", response.text)
