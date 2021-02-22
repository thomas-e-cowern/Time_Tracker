const mongoose = require('mongoose');
mongoose.Promise = global.Promise;

mongoose.connect("mongodb://localhost:27017/TimeTracker", { useNewUrlParser: true}).then(() => {
	console.log("connected to MongoDB");
}).catch((error) => {
	console.log("There was an error: " + error);
})

mongoose.set("useCreateIndex", true);
mongoose.set("useFindAndModify", false);

module.exports = {
	mongoose
};