(function(){var e;e=L.mapbox.map("map","velopants.hpmd16ih").setView([29.707,67.302],4),$.ajax({dataType:"text",url:"locations.json",type:"get",success:function(a){var t;return t=$.parseJSON(a),e.featureLayer.setGeoJSON(t)}},e.featureLayer.on("layeradd",function(e){var a,t,i;return a=e.layer,i=a.feature.properties,t='<div class="popup"><ul class="strike-details"><li>'+i.town+", "+i.country+"</li><li>"+i.date+"</li><hr><li>Deaths: "+i.deaths+"</li><li>Casualties: "+i.injuries+"</li><li>Summary: "+i.summary+"</li></ul>",$(".popup").append("test"),a.bindPopup(t,{closeButton:!1,minWidth:320})}))}).call(this);