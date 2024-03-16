var uuid_gen = require('node-uuid-generator');
var db = require('./db.js');

const create = async(name, owner, description, starttime, endtime, org, url) => {
    return new Promise(async(resolve, reject) => {
        var uuid = uuid_gen.generate();
        var dbResult = JSON.parse(await db.insert(
            "organizations",
            "`uuid`, `name`, `owner`, `description`, `starttime`, `endtime`, `org`, `url`",
            `'${uuid}','${name}','${owner}','${description}','${starttime}','${endtime}','${org}','${url}'`
        ));
        if (dbResult.result == "success") resolve(`{"result": "success","uuid": "${uuid}"}`);
        else resolve(`{"result": "error","type": "unknown"}`);
    });
};

const getInfo = async(uuid) => {
    return new Promise(async(resolve, reject) => {
        if (await db.searchExists("organizations", "uuid", uuid)) {
            var organization = await db.search("organizations", "uuid", uuid);
            resolve(`{"result": "success","name": "${organization.name}","owner": "${organization.owner}","description": "${organization.description}","starttime": "${organization.starttime}","endtime": "${organization.endtime}","university": "${organization.university}","org": "${organization.org}","url": "${organization.url},"votes": "${organization.votes}`);
        } else {
            resolve(`{"result": "error","type": "Organization doesn't exist"}`);
        }
    });
};
const upvote = async(uuid) => {
    return new Promise(async(resolve, reject) => {
        if (await db.searchExists("organizations", "uuid", uuid)) {
            var organization = await db.search("organizations", "uuid", uuid);
            var dbResult = JSON.parse(await db.update("organizations", "votes", organization.votes + 1, "uuid", uuid));
            if (dbResult.result == "success") resolve(`{"result": "success"}`);
            else resolve(`{"result": "error","type": "unknown"}`);
        } else {
            resolve(`{"result": "error","type": "Organization doesn't exist"}`);
        }
    });
}
const downvote = async(uuid) => { 
    return new Promise(async(resolve, reject) => {
        if (await db.searchExists("organizations", "uuid", uuid)) {
            var organization = await db.search("organizations", "uuid", uuid);
            var dbResult = JSON.parse(await db.update("organizations", "votes", organization.votes - 1, "uuid", uuid));
            if (dbResult.result == "success") resolve(`{"result": "success"}`);
            else resolve(`{"result": "error","type": "unknown"}`);
        } else {
            resolve(`{"result": "error","type": "Organization doesn't exist"}`);
        }
    });
}

module.exports = {
    create: create,
    getInfo: getInfo,
    upvote: upvote,
    downvote: downvote
};
