var express = require('express');	
var app = express();
var fs = require('fs');

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
