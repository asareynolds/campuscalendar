const express = require('express')
var bodyParser = require('body-parser')
const cors = require('cors');
const db = require('./db.js');
const user = require('./user.js');

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
    const { org_name, org_owner, org_description, org_starttime, org_endtime, org_org, org_url } = req.body
    res.setHeader('Content-Type', 'application/json');

    var createOrganizationResult = JSON.parse(await organization.create(org_name, org_owner, org_description, org_starttime, org_endtime, org_org, org_url))
    if (createOrganizationResult.result == "error") return res.end(`{"result": "error","type": "${createOrganizationResult.type}"}`);

    res.end(`{"result": "success","uuid": "${createOrganizationResult.uuid}"}`);
});
app.get('/organization/info', async(req, res) => {
    const { org_uuid } = req.query
    res.setHeader('Content-Type', 'application/json');

    var getOrganizationResult = JSON.parse(await organization.getInfo(org_uuid))
    if (getOrganizationResult.result == "error") return res.end(`{"result": "error","type": "${getOrganizationResult.type}"}`);

    res.end(`{"result": "success","uuid": "${org_uuid}","name": "${getOrganizationResult.name}","owner": "${getOrganizationResult.owner}","description": "${getOrganizationResult.description}","starttime": "${getOrganizationResult.starttime}","endtime": "${getOrganizationResult.endtime}","org": "${getOrganizationResult.org}","url": "${getOrganizationResult.url}"}`);
});
app.get('/organization/upvote', async(req, res) => {
    const { org_uuid } = req.query
    res.setHeader('Content-Type', 'application/json');

    var upvoteOrganizationResult = JSON.parse(await organization.upvote(org_uuid))
    if (upvoteOrganizationResult.result == "error") return res.end(`{"result": "error","type": "${upvoteOrganizationResult.type}"}`);

    res.end(`{"result": "success"}`);
});
app.get('/organization/downvote', async(req, res) => {
    const { org_uuid } = req.query
    res.setHeader('Content-Type', 'application/json');

    var downvoteOrganizationResult = JSON.parse(await organization.downvote(org_uuid))
    if (downvoteOrganizationResult.result == "error") return res.end(`{"result": "error","type": "${downvoteOrganizationResult.type}"}`);

    res.end(`{"result": "success"}`);
});

app.post('/event/create', async(req, res) => {
});
app.get('/event/info', async(req, res) => { // App is sending get request: (URL args) EventID
}); // App is expecting: JSON object of event
app.get('/events', async(req, res) => { // App is sending get request: (URL args) UserID, Starttime, Endtime, Organization
}); // App is expecting: JSON array of events

app.get('/universities', async(req, res) => {
});

app.post('/test', async(req, res) => {
    res.end(`{"result": "success","uuid": "test"}`);
});
app.get('/test', async(req, res) => {
    res.end(`{"result": "success","uuid": "test"}`);
});