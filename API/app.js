const express = require('express');
const app = express();

// GET segments - get the existing time segments in the database
app.get('/segments', (req, res) => {
	// Return an array of time segments
	res.send("Hit the get");
})

// POST segments = create a new segment and return segments
app.post('/segments', (req, res) => {
	// Return an array of time segments
	res.send("Hit the post");
})

// PATCH segments - update the specified segment
app.patch('/segments/:id', (req, res) => {
	// Return an array of time segments
	res.send("Hit the patch");
})

// DELETE segment - delete the specified segment
app.delete('/segments/:id', (req, res) => {
	// Return an array of time segments
	res.send("Hit the delete");
})



app.listen(3000, () => {
	console.log("Server is listening at port 3000");
})