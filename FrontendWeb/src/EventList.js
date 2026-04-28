import React, { useState, useEffect } from 'react';
import { listEvents } from './api';
import axios from 'axios'; // Make sure to install axios with `npm install axios`


const EventList = () => {
    const [events, setEvents] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        const fetchEvents = async () => {
            try {
                const userUuid = '07198b4b-72ec-4d95-9fe8-fdf178e67cde'; // Replace with the actual user UUID
                const response = await axios.get(`https://api.campuscal.tech/events?user_uuid=${userUuid}&tailored=false`); // Set tailored to false
                let eventsArray = Object.values(response.data.events); // Convert the events object to an array
                if (Array.isArray(eventsArray)) {
                    for (let event of eventsArray) {
                        const orgResponse = await axios.get(`https://api.campuscal.tech/organization/info?org_uuid=${event.org}`);
                        event.org = orgResponse.data.name; // Replace the org UUID with the org name
                    }
                    setEvents(eventsArray);
                } else {
                    throw new Error('Invalid response format');
                }
            } catch (error) {
                setError(error.message);
            } finally {
                setLoading(false);
            }
        };

        fetchEvents();
    }, []);

    if (loading) {
        return <p>Loading...</p>;
    }

    if (error) {
        return <p>Error: {error}</p>;
    }

    return (
        <div className="container">
            <div className="row">
                {events.map((event, index) => (
                    <div key={index} className="col-md-4">
                        <div className="card mb-4">
                            <div className={`event-bar ${event.type}`} />
                            <div className="card-body">
                                <h5 className="card-title">{event.title}</h5>
                                <h6 className="card-subtitle mb-2 text-muted">
                                    {new Date(event.starttime * 1000).toLocaleString('en-US', { month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', hour12: true })}
                                    -
                                    {event.endtime ? new Date(event.endtime * 1000).toLocaleString('en-US', { month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', hour12: true }) : 'N/A'}
                                </h6>
                                <p className="card-text">{event.description}</p>
                                <p className="card-text"><small className="text-muted">{event.org}</small></p>
                            </div>
                        </div>
                    </div>
                ))}
            </div>
        </div>
    );
};

export default EventList;