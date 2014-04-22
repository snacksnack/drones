var somalia =  JSON.parse(document.getElementById("somalia_per_year").getAttribute('data-somalia'));
var yemen =  JSON.parse(document.getElementById("yemen_per_year").getAttribute('data-yemen'));
var pakistan = JSON.parse(document.getElementById("pakistan_per_year").getAttribute('data-pakistan'));

var palette = new Rickshaw.Color.Palette( { scheme: 'spectrum14' } );

  var graph = new Rickshaw.Graph ( {
    element: document.querySelector("#spy_chart"),
    width: 450,
    height: 200,
    series: [
              
              {
                name: "Somalia",
                data:  somalia,
                color: palette.color()
              },
              {
                name: "Yemen",
                data:  yemen,
                color: palette.color()
              },
              {
                name: "Pakistan",
                data:  pakistan,
                color: palette.color()
              }
        ]
  } );

  var x_axis = new Rickshaw.Graph.Axis.Time( { graph: graph } );

  var y_axis = new Rickshaw.Graph.Axis.Y ( {
    graph: graph,
    orientation: 'left',
    tickFormat: Rickshaw.Fixtures.Number.formatKBMT,
    element: document.getElementById('spy_y_axis'),
  });

  var legend = new Rickshaw.Graph.Legend( {
    element: document.querySelector('#spy_legend'),
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