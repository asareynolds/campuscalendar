const express = require('express')
var bodyParser = require('body-parser')
const cors = require('cors');
const db = require('./db.js');
var sha256 = require('js-sha256').sha256;

const app = express();
app.use(bodyParser.json())

app.use(cors());
app.listen(100, () => {
    console.log('Accepting requests on port 100');
});
app.set('trust proxy', true)

app.post('/test', async(req, res) => {
    res.end(`{"result": "success","uuid": "test"}`);
    /*const { client_id, client_ip } = JSON.parse(authFromHeaders(req))
    const { user_username, user_email, user_pass, user_fname, user_lname } = req.body
    res.setHeader('Content-Type', 'application/json');
    var createUserResult = JSON.parse(await user.create(user_username, user_email, user_pass, user_fname, user_lname))
    if (createUserResult.result == "error") return res.end(`{"result": "error","type": "${createUserResult.type}"}`);
    email.sendVerification(createUserResult.uuid)
    var createTokenResult = JSON.parse(await token.generate("standard", createUserResult.uuid, client_id, client_ip))
    if (createTokenResult.result == "error") return res.end(`{"result": "error","type": "${createTokenResult.type}"}`);
    res.end(`{"result": "success","uuid": "${createUserResult.uuid}","token": "${createTokenResult.token}"}`);*/
});