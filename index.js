var express = require('express');	
var app = express();
var fs = require('fs');
var MongoClient = require('mongodb').MongoClient;
var assert = require('assert');
var bodyParser = require('body-parser');
app.use(bodyParser());
var path = require('path');

app.use(express.static(__dirname + '/public'));

var url = 'mongodb://heroku_swnsvj81:cdd371vcopbsed5o0uf8d6e8l0@ds013951.mlab.com:13951/heroku_swnsvj81';

app.post('/place', function(req, res){
		MongoClient.connect(url, function(err, db){
				assert.equal(null, err);
				console.log("Connected");		
				var collection = db.collection('orders');
				var data = req.body;
				console.log(data);
				collection.insert(data);
				db.close;
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
