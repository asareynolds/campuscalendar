var uuid_gen = require('node-uuid-generator');
var db = require('./db.js');

const create = async(username, email, password, name) => {
    return new Promise(async(resolve, reject) => {
        var uuid = uuid_gen.generate()
        var dbResult = JSON.parse(await db.insert(
            "users",
            "`uuid`, `username`, `email`, `password`, `name`",
            `'${uuid}','${username}','${email}','${password}','${name}'`
        ))
        if (dbResult.result == "success") resolve(`{"result": "success","uuid": "${uuid}"}`);
        else resolve(`{"result": "error","type": "unknown"}`);
    });
}
const getInfo = async(uuid) => {
    return new Promise(async(resolve, reject) => {
        if (await db.searchExists("users", "uuid", uuid)) {
            var user = await db.search("users", "uuid", uuid)
            resolve(`{"result": "success","username": "${user.username}","email": "${user.email}","password": "${user.password}","name": "${user.name}"}`)
        } else {
            resolve(`{"result": "error","type": "User doesn't exist"}`);
        }
    });
}
const getPreferences = async(uuid) => {
    return new Promise(async(resolve, reject) => {
        if (await db.searchExists("users", "uuid", uuid)) {
            var user = await db.search("users", "uuid", uuid)
            resolve(`{"result": "success","uuid": "${uuid}","preferences": "${user.preferences}"}`)
        } else {
            resolve(`{"result": "error","type": "User doesn't exist"}`);
        }
    });
}
const setPreferences = async(uuid, preferences) => {
    return new Promise(async(resolve, reject) => {
        if (await db.searchExists("users", "uuid", uuid)) {
            var dbResult = JSON.parse(await db.update("users", "preferences", preferences, "uuid", uuid))
            if (dbResult.result == "success") resolve(`{"result": "success"}`);
            else resolve(`{"result": "error","type": "unknown"}`);
        } else {
            resolve(`{"result": "error","type": "User doesn't exist"}`);
        }
    });
}

module.exports = {
    create: create,
    getInfo: getInfo,
    getPreferences: getPreferences,
    setPreferences: setPreferences
};