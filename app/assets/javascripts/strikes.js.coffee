#initiate map
map = L.mapbox.map('map','velopants.hpmd16ih').setView([29.707,67.302], 4);
##map2 = L.mapbox.map('map2','velopants.hpl8jjg3').setView([15.671,47.28], 7);

$.ajax
  dataType: 'text'
  url: 'locations.json'
  type: 'get'
  success: (data) ->
    geojson = $.parseJSON(data)
    map.featureLayer.setGeoJSON(geojson)
  
  map.featureLayer.on 'layeradd', (e) ->
    marker = e.layer
    properties = marker.feature.properties
    
  #create custom popup
    popupContent = '<div class="popup">' +
      '<ul class="strike-details">' +
      '<li>' + properties.town + ', ' + properties.country + '</li>' +
      '<li>' + properties.date + '</li>' +
      '<hr>' +
      '<li>Deaths: ' + properties.deaths + '</li>' +
      '<li>Casualties: ' + properties.injuries + '</li>' +
      '<li>Summary: ' + properties.summary + '</li>' +
      '</ul>'
    #$(".leaflet-popup-pane").append("test");
    ###$('#container-1').slideUp 'slow', ->
    $('#container-2').html("<div class='row'><div class='small-12 columns'><%= j render 'my_partial' %></div></div>")
    $('#container-2').slideDown()
    ###
    $('.popup').append("test");  
    
    marker.bindPopup popupContent,
      closeButton: false
      minWidth: 320