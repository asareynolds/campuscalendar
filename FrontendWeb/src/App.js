import React from 'react';
import EventList from './EventList';
import 'bootstrap/dist/css/bootstrap.min.css';
import './App.css';

function App() {
    const events = []; // Replace this with your actual events data

    return (
        <div className="App">
            <div className="header">Campus Calendar</div>
            <EventList events={events} />
        </div>
    );
}

export default App;