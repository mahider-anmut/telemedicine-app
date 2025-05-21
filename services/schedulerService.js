
const schedule = require('node-schedule');


const hourlyScheduler = () => {
    var rule = new schedule.RecurrenceRule();
    
    rule.minute = 0;
    
    var w = schedule.scheduleJob(rule, function () {
        //TODO: call expire appointments
    });
    return w;
}


module.exports = {
    hourlyScheduler
}