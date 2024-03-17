![campusCalendarLogo](https://github.com/asareynolds/campuscalendar/blob/b779d518398ac18c2ceb7bb309fd6da8953b82a8/Logo/campusCalendarLogo.png)
## The Problem
College is overwhelming. For many, trying to find something to do on a Friday night is a stressful and isolating experience. The sheer number of events happening on campus can make it impossible to know what's going on, not to mention information is spread across several websites. Additionally, there is no way for students to easily share their own events without being an executive at an organization. There’s no central repository for accurate, up-to-date information on what's going on. Each academic college publishes its own events - and it’s the same story with the Bryce Jordan Center, student organizations, and town events. As students ourselves, we felt like we all needed a place to easily share our own events and easily know what was going on around campus.

## The Solution
We created a space where students can easily find and host their own events. Our app, Campus Calendar, can sort events from across the community and even provide AI-driven, personalized recommendations. Students can rate events, save them to their local calendar, and add events of their own. Ease of use, simplicity, and safety were some of our top development considerations. We supported these goals by implementing intuitive gestures, a clean design language, and clear distinctions between user-posted and official events.

## Our Technology
We built a responsive iOS app using Swift UI. Our backend is written in Node.js, hosted on a redundant Kubernetes cluster via Oracle Cloud, and served via Cloudflare’s global CDN for speed and DDOS protection. We used Google’s Gemini LLM to parse multiformat external event data and pass JSON to our SQL database pipeline. For personalized recommendations, we used custom prompting with the GPT 3.5-Turbo API to match user preferences to a list of upcoming events and identify the most relevant results.  For our web app we made a react-native responsive app that can be run on any device and gets live data from our API server. Everything is SSL encrypted. 

## Challenges and Solutions
This was the first hackathon for one of our developers: they had to quickly adjust to the high-pressure environment of HackPSU. Another challenge came from working together on the same files with Git. This wasn’t a perfect process, and we had a few merge conflicts that we had to fix at the last minute.

## Accessibility
We prioritize accessibility in our design. By following WCAG and ADA guidelines, we made sure to produce an app that was screen-reader compatible and user-friendly. Choices like high contrast, large button size, a text-first interface, and a color-blind mode ensure that everyone can use our app regardless of disability. 

## Accomplishments that we’re proud of
We are proud of the technology we’ve made in 24 hours — a scalable full-stack iOS app and React frontend that can provide real impact for the Penn State community. We focused hard on scalability, and we learned how to build our project in a way that could easily be iterated on and expanded. 

## What we learned
We had a major learning experience in our design process. We wanted to use colored tabs to convey the type of event, but realized that this would pose an accessibility challenge. We adapted to this by building a colorblind mode to make information equally available to all users. This helped us consider the impact of our design choices to make the app as accessible as possible.

## Operationalization
One of the most exciting parts of CampusCalendar is the scalability. We are able to take live event data from any university that is using OrgCentral, as well as user-generated data without limit. As we grow, we plan to allow sponsored listings from local businesses to support our team. Additionally, we plan to expand beyond colleges and into local communities. Future concepts we’d love to implement include event chats, local LLM processing, 

## Open-Source Technology Used
Express
MySQL
