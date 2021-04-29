var express = require('express');

var app = express();
var handlebars = require('express-handlebars').create({defaultLayout:'main'});
var bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');
app.set('port', 8282);
app.use(express.static('public'));

app.get('/',function(req,res){
  res.render('home');
});

app.get('/coaches',function(req,res){
  res.render('coaches');
});

app.get('/teams',function(req,res){
  res.render('teams');
});

app.get('/players',function(req,res){
  res.render('players');
});

app.get('/matches',function(req,res){
  res.render('matches');
});

app.get('/venues',function(req,res){
  res.render('venues');
});

app.get('/matches_teams',function(req,res){
  res.render('matches_teams');
});

app.use(function(req,res){
  res.status(404);
  res.render('404');
});

app.use(function(err, req, res, next){
  console.error(err.stack);
  res.type('plain/text');
  res.status(500);
  res.render('500');
});

app.listen(app.get('port'), function(){
  console.log('Express started on http://localhost:' + app.get('port') + '; press Ctrl-C to terminate.');
});
