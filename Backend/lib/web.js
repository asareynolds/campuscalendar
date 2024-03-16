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

app.post('/organization/create', async(req, res) => {
});
app.get('/organization/info', async(req, res) => {
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