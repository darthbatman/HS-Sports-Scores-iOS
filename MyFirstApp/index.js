var app = require("express")();
var http = require("http").Server(app);
var bodyParser = require('body-parser');

var teamOne = "";
var teamTwo = "";
var teamOneScore;
var teamTwoScore;

app.use(bodyParser.urlencoded({
	extended: true
}));

app.use(bodyParser.json());

app.get("/", function(req, res){
	res.sendFile(__dirname + "/index.html");
});

app.post("/gameinfo", function(req, res){

	teamOne = req.body.schoolName1;
	teamTwo = req.body.schoolName2;
	teamOneScore = req.body.score1;
	teamTwoScore = req.body.score2;

	console.log(teamOne + ": " + teamOneScore + "\n" + teamTwo + ": " + teamTwoScore);

	res.send(teamOne + ": " + teamOneScore + "\n" + teamTwo + ": " + teamTwoScore);
});

app.get("/getinfo", function(req, res){
	res.setHeader('Content-Type', 'application/json');
    res.send(JSON.stringify({
    	tOne: teamOne,
    	tTwo: teamTwo,
    	tOneS: teamOneScore,
    	tTwoS: teamTwoScore
    }));
});

http.listen(8888, function(){
	console.log("Listening on *:8888");
});
