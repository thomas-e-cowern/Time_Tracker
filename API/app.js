const express = require('express');
const app = express();
const bodyParser = require('body-parser');

const { mongoose } = require('./database/mongoose');

const { Segment } = require('./database/Models/segment.model');
const { Project } = require('./database/Models/project.model');

app.use(bodyParser.json());

// GET segments - get the existing time segments in the database
app.get('/segments', (req, res) => {
	// Return an array of time segments
// 	res.send("Hit the get");
	Segment.find({}).then((segments) => {
		res.send(segments);
	})
})

// POST segments = create a new segment and return segments
app.post('/segments', (req, res) => {
	// Return an array of time segments
// 	res.send("Hit the post");
	let date = req.body.date;
	let startTime = req.body.startTime;
	let stopTime = req.body.stopTime;
	let project = req.body.project;
	
// 	console.log("date: " + date);
// 	console.log("startTime: " + startTime);
// 	console.log("stopTime: " +stopTime);
// 	console.log("project: " + project);
	
	let newSegment = new Segment({
		date,
		startTime,
		stopTime,
		project
	});
	
	newSegment.save().then((newSeg) => {
		res.send(newSeg);
	})
})

// PATCH segments - update the specified segment
app.patch('/segments/:id', (req, res) => {
	// Return an array of time segments
// 	res.send("Hit the patch");
	console.log("id: " + req.params.id);
	Segment.findOneAndUpdate({ _id: req.params.id }, {
		$set: req.body
	}).then(() => {
		res.sendStatus(200);
	})
})

// DELETE segment - delete the specified segment
app.delete('/segments/:id', (req, res) => {
	// Return an array of time segments
// 	res.send("Hit the delete");
	Segment.findOneAndRemove({
		_id: req.params.id
	}).then((removedSegment) => {
		res.send(removedSegment);
	})
})



app.listen(3000, () => {
	console.log("Server is listening at port 3000");
})