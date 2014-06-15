//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require jquery.easy-pie-chart.js
//= require_tree .

var TodoApp = {
  init: function(){

    this.initCharts();
    this.ajaxTodoForm();

  },

  initCharts: function(){
    $('.chart').easyPieChart({
      scaleColor: false,
      lineWidth: 10,
      size: 240,
      trackColor: "#eeeeee",
      barColor: function(p){
        var color = '#9b59b6';
        if(p >= 50){
          color = '#8e44ad';
        }
        return color;
      }
    });
  },

  ajaxTodoForm: function(){

  }

}

$(document).on('page:change', function() {

  TodoApp.init()
});