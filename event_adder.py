import requests

events = [
{
    "event_starttime": 1710786600000, 
    "event_endtime": 1710790200000,
    "event_name": "Computer Science Study Session",
    "event_description": "This test is going to kick my butt tomorrow. Hoping to get some people together to study- Location: HUB Chairs",
    "event_org": "97bd9f93-4b26-47d9-84c2-487369f6f2c5",
    "event_type": "user",
  }
]

api_url = "https://api.campuscal.tech/event/create"

for event in events:
    response = requests.post(api_url, json=event)
    if response.status_code == 200:
        print("Event created successfully:", event["event_name"])
    else:
        print("Failed to create event:", event["event_name"], "Error:", response.text)
