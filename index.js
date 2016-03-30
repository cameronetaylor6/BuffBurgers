var express = require('express');	
var app = express();
var fs = require('fs');
var MongoClient = require('mongodb').MongoClient;
var assert = require('assert');
var bodyParser = require('body-parser');
app.use(bodyParser());

var url = 'mongodb://alex:pinky2228@ds025469.mlab.com:25469/buffburgersorders';

app.post('/place', function(req, res){
		MongoClient.connect(url, function(err, db){
				assert.equal(null, err);
				console.log("Connected");		
				var collection = db.collection('orders');
				var data = req.body;
				console.log(data);
				collection.insert(data);
		});
});
/*
MongoClient.connect(url, function(err, db) {
		assert.equal(null, err);
		console.log("Connected correctly to server.");
});*/
app.get('/', function (req, res){
	fs.readFile('html/index.html', function(err, text){
		res.setHeader('Context-Type', 'text/html');
		res.end(text);
	});
	return;
});
var server = app.listen(process.env.PORT || 3000, function (){
				var host = server.address().address;
				var port = server.address().port;

				console.log('Example app listening at http://%s:%s', host, port);
});
