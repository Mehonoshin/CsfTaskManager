var date = new Date();
var d = date.getDate();
var m = date.getMonth();
var y = date.getFullYear();

// Twitter bootstrap
$(document).ready(function() {
    $(".topbar").dropdown();
});

$(document).ready(function() {
	
	var Goal = Backbone.Model.extend({
		url: "/goals"
	});
	var GoalsList = Backbone.Collection.extend({
		model: Goal,
		url: '/goals'
	});
	
	var goalsView = Backbone.View.extend({
		initialize: function() {
			this.goals = new GoalsList();
		},
		el: $('#app'),
		events: {
			"click .add-btn": "addGoal",
			"click #load": "loadGoals"
		},
		render: function() {
			this.loadGoals();
		},
		addGoal: function() {
			newTitle = $('.goal-title').val();
			newNote = $('.goal-note').val();
			newGoal = new Goal({title: newTitle, note: newNote});
			newGoal.save();
			this.goals.add(newGoal);
		},
		loadGoals: function() {
			this.goals.fetch();
			$("#goals-list").html('');
			this.goals.each(function(goal) {
				$("#goals-list").append("<li>" + goal.get('title') + "(" + goal.get('note') + ")</li>");	
			});			
		}
	});
	
	var myRouter = Backbone.Router.extend({
		initialize: function() {
			goalsBlock = new goalsView();
		},
		routes: {
			"!/": "root",
			"!/form": "form",
			"!/role": "role"
		},
		root: function() {
			$('.app-screen').hide();			
			$('#calendar-grid').show();
		},
		form: function() {
			$('.app-screen').hide();
			$('#goal-form').show();			
		},
		role: function() {
			$('.app-screen').hide();
			$('#role-form').show();			
		}
	});
	
	var rt = new myRouter;
	Backbone.history.start();
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		editable: true,
		events: [
			{
				title: 'All Day Event',
				start: new Date(y, m, 1)
			},
			{
				title: 'Long Event',
				start: new Date(y, m, d-5),
				end: new Date(y, m, d-2)
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: new Date(y, m, d-3, 16, 0),
				allDay: false
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: new Date(y, m, d+4, 16, 0),
				allDay: false
			},
			{
				title: 'Meeting',
				start: new Date(y, m, d, 10, 30),
				allDay: false
			},
			{
				title: 'Lunch',
				start: new Date(y, m, d, 12, 0),
				end: new Date(y, m, d, 14, 0),
				allDay: false
			},
			{
				title: 'Birthday Party',
				start: new Date(y, m, d+1, 19, 0),
				end: new Date(y, m, d+1, 22, 30),
				allDay: false
			},
			{
				title: 'Click for Google',
				start: new Date(y, m, 28),
				end: new Date(y, m, 29),
				url: 'http://google.com/'
			}
		]
	});
});