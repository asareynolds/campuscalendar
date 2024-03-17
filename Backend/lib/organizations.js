var uuid_gen = require('node-uuid-generator');
var db = require('./db.js');

const create = async(owner, name, description) => {
    return new Promise(async(resolve, reject) => {
        var uuid = uuid_gen.generate();
        var dbResult = JSON.parse(await db.insert(
            "organizations",
            "`uuid`, `owner`, `name`, `description`",
            `'${uuid}','${owner}','${name}','${description}'`
        ));
        if (dbResult.result == "success") resolve(`{"result": "success","uuid": "${uuid}"}`);
        else resolve(`{"result": "error","type": "unknown"}`);
        
    });
};

const getInfo = async(uuid) => {
    return new Promise(async(resolve, reject) => {
        if (await db.searchExists("organizations", "uuid", uuid)) {
            var organization = await db.search("organizations", "uuid", uuid);
            resolve(`{"result": "success","uuid": "${uuid}","owner": "${organization.owner}","name": "${organization.name}","description": "${organization.description}"}`);
        } else {
            resolve(`{"result": "error","type": "organization doesn't exist"}`);
        }
        
    });
};

const getOrgs = async() => {
    return new Promise(async(resolve, reject) => {
        var orgs = await db.search("organizations", "1", "1", true);
        var parsedOrgs = [];
        for (var i = 0; i < orgs.length; i++) {
            var org = orgs[i];
            var parsedOrg = {
                id: org.uuid,
                name: org.name
            };
            parsedOrgs.push(parsedOrg);
        }
        resolve(parsedOrgs);
    });
}

module.exports = {
    create: create,
    getInfo: getInfo,
    getOrgs: getOrgs
};
