var uuid_gen = require('node-uuid-generator');
var db = require('./db.js');

const create = async(name, owner, description, starttime, endtime, org, url, type) => {
    return new Promise(async(resolve, reject) => {
        var uuid = uuid_gen.generate();
        var dbResult = JSON.parse(await db.insert(
            "events",
            "`uuid`, `title`, `org`, `description`, `starttime`, `endtime`, `university`, `url`, `type`",
            `'${uuid}','${name}','${owner}','${description}','${starttime}','${endtime}','${org}','${url}','${type}'`
        ));
        if (dbResult.result == "success") resolve(`{"result": "success","uuid": "${uuid}"}`);
        else resolve(`{"result": "error","type": "unknown"}`);
    });
};

const getInfo = async(uuid) => {
    return new Promise(async(resolve, reject) => {
        if (await db.searchExists("events", "uuid", uuid)) {
            var events = await db.search("events", "uuid", uuid);
            resolve(`{"result": "success","uuid": "${uuid}","title": "${events.title}","org": "${events.org}","description": "${events.description}","starttime": "${events.starttime}","endtime": "${events.endtime}","university": "${events.university}","url": "${events.url}","votes": "${events.votes}", "type": "${events.type}"}`);
        } else {
            resolve(`{"result": "error","type": "events doesn't exist"}`);
        }
    });
};
const upvote = async(uuid) => {
    return new Promise(async(resolve, reject) => {
        if (await db.searchExists("events", "uuid", uuid)) {
            var events = await db.search("events", "uuid", uuid);
            var dbResult = JSON.parse(await db.update("events", "votes", events.votes + 1, "uuid", uuid));
            if (dbResult.result == "success") resolve(`{"result": "success","votes": "${events.votes + 1}"}`);
            else resolve(`{"result": "error","type": "unknown"}`);
        } else {
            resolve(`{"result": "error","type": "events doesn't exist"}`);
        }
    });
}
const downvote = async(uuid) => { 
    return new Promise(async(resolve, reject) => {
        if (await db.searchExists("events", "uuid", uuid)) {
            var events = await db.search("events", "uuid", uuid);
            var dbResult = JSON.parse(await db.update("events", "votes", events.votes - 1, "uuid", uuid));
            if (dbResult.result == "success") resolve(`{"result": "success","votes": "${events.votes - 1}"}`);
            else resolve(`{"result": "error","type": "unknown"}`);
        } else {
            resolve(`{"result": "error","type": "events doesn't exist"}`);
        }
    });
}
const getAll = async() => {
    return new Promise(async(resolve, reject) => {
        var events = await db.search("events", "1", "1", true);
        var parsedEvents = {};
        for (var i = 0; i < events.length; i++) {
            var event = events[i];
            var parsedEvent = {
                id: event.uuid,
                title: event.title,
                org: event.org,
                description: event.description,
                starttime: event.starttime,
                endtime: event.endtime,
                university: event.university,
                url: event.url,
                votes: event.votes,
                type: event.type
            };
            parsedEvents[i] = parsedEvent;
        }
        resolve(parsedEvents);
    });
}

module.exports = {
    create: create,
    getInfo: getInfo,
    upvote: upvote,
    downvote: downvote,
    getAll: getAll
};
