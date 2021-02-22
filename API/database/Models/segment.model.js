const mongoose = require("mongoose");

const SegmentSchema = new mongoose.Schema({
	date: {
	 	type: String,
	 	required: true,
	 	minlength: 1,
	 	trim: true
	},
	startTime: {
		type: String,
	 	required: true,
	 	minlength: 1,
	 	trim: true
	},
	stopTime: {
		type: String,
	 	required: true,
	 	minlength: 1,
	 	trim: true
	},
	project: {
		type: String,
	 	required: true,
	 	minlength: 1,
	 	trim: true
	}
})

const Segment = mongoose.model('Segment', SegmentSchema);

module.exports = {
	Segment
}