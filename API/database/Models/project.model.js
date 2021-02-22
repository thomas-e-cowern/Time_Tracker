const mongoose = require("mongoose");

const  ProjectSchema = new mongoose.Schema({
   projectId: {
	 	type: mongoose.Types.ObjectId,
	 	required: true
	},
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

const Project = mongoose.model('Project', ProjectSchema);

module.exports = {
	Project
}