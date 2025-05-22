
const schedule = require('node-schedule');


const hourlyScheduler = (title,taskFunction) => {
    var rule = new schedule.RecurrenceRule();
    
    rule.minute = 0;
    
    const job = schedule.scheduleJob(rule, function () {
        console.log("Running scheduled task: '"+title+"' at "+new Date());
        taskFunction();
    });

    return job;
}


module.exports = {
    hourlyScheduler
}