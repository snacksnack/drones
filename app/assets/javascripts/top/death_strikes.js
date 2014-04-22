var total_deaths = JSON.parse(document.getElementById('all_deaths').getAttribute('data-all-deaths'));
var civilian_deaths = JSON.parse(document.getElementById('civilian_deaths').getAttribute('data-civilian-deaths'));

console.log(total_deaths)
console.log(civilian_deaths)

var palette = new Rickshaw.Color.Palette( { scheme: 'spectrum14' } );

  var graph = new Rickshaw.Graph ( {
    element: document.querySelector("#death_chart"),
    width: 450,
    height: 200,
    series: [
              
              {
                name: "Civilian Deaths",
                data:  civilian_deaths,
                color: palette.color()
              },
              {
                name: "All Deaths",
                data:  total_deaths,
                color: palette.color()
              }
            ]
  } );

  var x_axis = new Rickshaw.Graph.Axis.Time( { graph: graph } );

  var y_axis = new Rickshaw.Graph.Axis.Y ( {
    graph: graph,
    orientation: 'left',
    tickFormat: Rickshaw.Fixtures.Number.formatKBMT,
    element: document.getElementById('death_y_axis'),
  });

  var legend = new Rickshaw.Graph.Legend( {
    element: document.querySelector('#death_legend'),
    graph: graph
  } );

  var highlighter = new Rickshaw.Graph.Behavior.Series.Highlight({
    graph: graph,
    legend: legend
  } );

  var order = new Rickshaw.Graph.Behavior.Series.Order({
    graph: graph,
    legend: legend
  } );

  var hoverDetail = new Rickshaw.Graph.HoverDetail( {
    graph: graph
  } );

  graph.render();