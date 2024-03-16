const express = require('express')
var bodyParser = require('body-parser')
const cors = require('cors');
const db = require('./db.js');
const user = require('./user.js');
//const organization = require('./organization.js');
const event = require('./events.js');

const app = express();
app.use(bodyParser.json())

app.use(cors());
app.listen(80, () => {
    console.log('Accepting requests on port 80');
});
app.set('trust proxy', true)

app.post('/user/create', async(req, res) => { // App is sending post request: (JSON args) username, email, password, name
    const { user_username, user_email, user_pass, user_name } = req.body
    res.setHeader('Content-Type', 'application/json');

    if (!user_email.endsWith('.edu')) return res.end({"result": "error","type": "Invalid email domain"});

    var createUserResult = JSON.parse(await user.create(user_username, user_email, user_pass, user_name ))
    if (createUserResult.result == "error") return res.end(`{"result": "error","type": "${createUserResult.type}"}`);

    res.end(`{"result": "success","uuid": "${createUserResult.uuid}"}`);
}); // App is expecting: UserID
app.post('/user/preferences', async(req, res) => {
    const { user_uuid, user_preferences } = req.body
    res.setHeader('Content-Type', 'application/json');

    var setPreferencesResult = JSON.parse(await user.setPreferences(user_uuid, user_preferences))
    if (setPreferencesResult.result == "error") return res.end(`{"result": "error","type": "${setPreferencesResult.type}"}`);

    res.end(`{"result": "success"}`);
});
app.get('/user/preferences', async(req, res) => {
    const { user_uuid } = req.query
    res.setHeader('Content-Type', 'application/json');

    var getPreferencesResult = JSON.parse(await user.getPreferences(user_uuid))
    if (getPreferencesResult.result == "error") return res.end(`{"result": "error","type": "${getPreferencesResult.type}"}`);

    res.end(`{"result": "success","uuid": "${user_uuid}","preferences": "${getPreferencesResult.preferences}"}`);
});

app.post('/organization/create', async(req, res) => { // App is sending post request: (JSON args) title, starttime, endtime, description, org, url
    const { org_owner, org_name, org_description } = req.body
    res.setHeader('Content-Type', 'application/json');

    var createOrganizationResult = JSON.parse(await organization.create(org_owner, org_name, org_description))
    if (createOrganizationResult.result == "error") return res.end(`{"result": "error","type": "${createOrganizationResult.type}"}`);

    res.end(`{"result": "success","uuid": "${createOrganizationResult.uuid}"}`);
});
app.get('/organization/info', async(req, res) => { // App is sending get request: (URL args) OrganizationID
    const { org_uuid } = req.query
    res.setHeader('Content-Type', 'application/json');

    var getOrganizationResult = JSON.parse(await organization.getInfo(org_uuid))
    if (getOrganizationResult.result == "error") return res.end(`{"result": "error","type": "${getOrganizationResult.type}"}`);

    res.end(`{"result": "success","uuid": "${org_uuid}","owner": "${getOrganizationResult.owner}","name": "${getOrganizationResult.name}","description": "${getOrganizationResult.description}"}`);
});
app.get('/organizations', async(req, res) => { // List All Orgs
    res.setHeader('Content-Type', 'application/json');

    var getOrgsResult = JSON.parse(await organization.getOrgs())
    if (getOrgsResult.result == "error") return res.end(`{"result": "error","type": "${getOrgsResult.type}"}`);

    res.end(`{"result": "success","organizations": ${JSON.stringify(getOrgsResult)}}`);
});

app.post('/event/create', async(req, res) => {
    const { event_name, event_org, event_description, event_starttime, event_endtime, event_university, event_url } = req.body
    res.setHeader('Content-Type', 'application/json');

    var createEventResult = JSON.parse(await event.create(event_name, event_org, event_description, event_starttime, event_endtime, event_university, event_url))
    if (createEventResult.result == "error") return res.end(`{"result": "error","type": "${createEventResult.type}"}`);

    res.end(`{"result": "success","uuid": "${createEventResult.uuid}"}`);    
});
app.get('/event/info', async(req, res) => { // App is sending get request: (URL args) EventID
    const { event_uuid } = req.query
    res.setHeader('Content-Type', 'application/json');

    var getEventResult = JSON.parse(await event.getInfo(event_uuid))
    if (getEventResult.result == "error") return res.end(`{"result": "error","type": "${getEventResult.type}"}`);

    res.end(`{"result": "success","uuid": "${event_uuid}","title": "${getEventResult.title}","org": "${getEventResult.org}","description": "${getEventResult.description}","starttime": "${getEventResult.starttime}","endtime": "${getEventResult.endtime}","university": "${getEventResult.university}","url": "${getEventResult.url}","votes": "${getEventResult.votes}"}`);
}); // App is expecting: JSON object of event
app.get('/event/upvote', async(req, res) => { // App is sending post request: (URL args) EventID
    const { event_uuid } = req.query
    res.setHeader('Content-Type', 'application/json');

    var upvoteResult = JSON.parse(await event.upvote(event_uuid))
    if (upvoteResult.result == "error") return res.end(`{"result": "error","type": "${upvoteResult.type}"}`);

    res.end(`{"result": "success","votes": "${upvoteResult.votes}"}`);
});
app.get('/event/downvote', async(req, res) => { // App is sending post request: (JSON args) EventID
    const { event_uuid } = req.query
    res.setHeader('Content-Type', 'application/json');

    var downvoteResult = JSON.parse(await event.downvote(event_uuid))
    if (downvoteResult.result == "error") return res.end(`{"result": "error","type": "${downvoteResult.type}"}`);

    res.end(`{"result": "success","votes": "${downvoteResult.votes}"}`);
});
app.get('/events', async(req, res) => { // App is sending get request: (URL args) UserID, Starttime, Endtime, Organization
    const { user_uuid, event_starttime, event_endtime, event_org, taylored } = req.query
    res.setHeader('Content-Type', 'application/json');

    if (taylored) {
        var getEventsResult = JSON.parse(await event.getTaylored(user_uuid, event_starttime, event_endtime, event_org))
    } else {
        var getEventsResult = JSON.parse(await event.getAll())
    }
    
    if (getEventsResult.result == "error") return res.end(`{"result": "error","type": "${getEventsResult.type}"}`);

    res.end(`{"result": "success","events": ${JSON.stringify(getEventsResult)}}`);
}); // App is expecting: JSON array of events

app.get('/universities', async(req, res) => {
    res.end(`{"result": "success","universities": {"52b22807-b1bb-4bd1-86a7-f7b8de51f5c7": "The Pennsylvania State University"}}`);
});

app.post('/test', async(req, res) => {
    res.end(`{"result": "success","uuid": "test"}`);
});
app.get('/test', async(req, res) => {
    res.end(`{"result": "success","uuid": "test"}`);
});