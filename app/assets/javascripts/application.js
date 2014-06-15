//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require jquery.easy-pie-chart.js
//= require_tree .

$(document).on('page:change', function() {
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
});