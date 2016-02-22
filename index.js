var mysql      = require('mysql');
var express    = require("express");
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'buffburger'
});

connection.connect(function(err){
	if(err){
		console.log("Error connecting to database ... \n");
		return;
	}

	console.log("Database is connected ... \n");
});

connection.query('SELECT * FROM users', function(err, rows){
	if(err){
		console.log("Error reading from database ... \n");
		return;
	}

	console.log('Data received from Db:\n');
	for (var i = 0; i < rows.length; i++) {
		console.log(rows[i]);
	};
});

/*
var user = {username: 'mediumdaddy', password: 'ogtiny', email: 'ogbd@colorado.edu', verified: 1, jerk: 0}
connection.query('INSERT INTO users SET ?', user, function(err, res){
	if(err){
		console.log("Error inserting into database ... \n");
		return;
	}

	console.log('Last insert ID:', res.insertId);
});
*/

/*
connection.query('UPDATE users SET username = ? WHERE user_id = ?', ["dankmemes", 10], function(err, res){
	if(err){
		console.log("Error updating database ... \n");
		return;
	}

	console.log('Changed ' + res.changedRows + ' rows.');
});
*/

/*
connection.query('DELETE FROM users WHERE user_id = ?', [8], function(err, res){
	if(err){
		console.log("Error deleting from database ... \n");
		return;
	}

	console.log('Deleted ' + res.affectedRows + ' rows.');
});
*/

connection.end();