import requests

events = [
    {
        "starttime": 1720874400,
        "endtime": 1720876800,
        "title": "The Waggle Dance STEM Program",
        "details": "Young scientists will learn about the importance of dance in science. Location: Schlow Centre Region Library, 211 South Allen Street, State College, PA 16801",
        "link": "https://www.statecollege.com/event/the-waggle-dance-stem-program/"
    },
    {
        "starttime": 1721543400,
        "endtime": 1721548800,
        "title": "Nowruz",
        "details": "Nowruz also spelled Norooz... Location: Alumni Hall",
        "link": "https://orgcentral.psu.edu/event/9672918"
    },
    # Rest of the events...
]

api_url = "https://api.campuscal.tech/event/create"

for event in events:
    payload = {
        "event_starttime": event["starttime"],
        "event_endtime": event["endtime"],
        "event_name": event["title"],
        "event_description": event["details"],
        "event_url": event["link"],
        "event_org": "05baf114-4639-4511-b714-90a724a64dc2",
        "event_university": "52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",
        "type": "official"
    }
    response = requests.post(api_url, json=payload)
    if response.status_code == 200:
        print("Event created successfully:", event["title"])
    else:
        print("Failed to create event:", event["title"], "Error:", response.text)
