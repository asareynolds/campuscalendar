
const { OpenAI } = require('openai');
const { gpt_key } = require('../config.json');
const user = require('./user.js');
const event = require('./events.js');

const openai = new OpenAI({
  apiKey: gpt_key,
});

let APIcall = async (prompt) => { 
    return new Promise(async (resolve, reject) => {
        const chatCompletion = await openai.chat.completions.create({
            model: "gpt-3.5-turbo",
            messages: [{"role": "user", "content": prompt}],
        });
        console.log(chatCompletion.choices[0].message);
        resolve(chatCompletion.choices[0].message);
    });
}

const getRecommendations = async function(uuid) {
    var preferences = JSON.parse(await user.getPreferences(uuid));
    var events = await event.getAll();
    var events_string = "";
    
    Object.keys(events).forEach(function(key) {
        var event_id = events[key];
        events_string += `{"uuid": "${event_id.id}", "title": "${event_id.title}"},\n`;
    });
    
    var prompt = `A student has the following preferences: {${Buffer.from(preferences.preferences, 'base64').toString('utf-8')}}
    Compare the user's preferences against the following events, and select only exactly three events that most closely match. Only return the UUIDs of the three most closely matching events. Format the UUIDs in a JSON array. The output must only be the JSON array of UUIDs or the system will fail.\nAn example of the desired output is:\n[\n"52b22807-b1bb-4bd1-86a7-f7b8de51f5c7",\,"4cbedd1a-e5f8-4489-b11e-97bc0e805c7c",\n"bf7ed67d-1deb-499d-b20d-8ec2b667e110"\n]\nThe available events are {${events_string}}`;
    console.log("Sending request to ChatGPT with prompt: " + prompt);
    //var response = await APIcall(prompt);
    var response = `[
        "31704857-9c01-4f14-8668-b77c189eb98b",
        "c0fa2fa5-2fae-4787-8cf0-6be0fe14a505"
    ]`

    return response
    //return response['content'] 
}

module.exports = {
    getRecommendations: getRecommendations
};