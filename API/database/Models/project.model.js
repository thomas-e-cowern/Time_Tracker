const mongoose = require("mongoose");

const  ProjectSchema = new mongoose.Schema({
//    date: {
// 	 	type: String,
// 	 	required: true,
// 	 	minlength: 1,
// 	 	trim: true
// 	},
	projectName: {
		type: String,
	 	required: true,
	 	minlength: 1,
	 	trim: true
	},
	projectDeveloper: {
		type: String,
	 	required: true,
	 	minlength: 1,
	 	trim: true
	},
	projectDescription: {
		type: String,
	 	required: true,
	 	minlength: 1,
	 	trim: true
	}
})

const Project = mongoose.Model('Project', ProjectSchema);

module.exports = {
	Project
}