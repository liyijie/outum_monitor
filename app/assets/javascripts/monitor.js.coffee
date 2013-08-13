# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  baidu_map = new BMap.Map("allmap")
  baidu_map.centerAndZoom("上海", 5)
  baidu_map.addControl(new BMap.NavigationControl())
  markerClusterer = new BMapLib.MarkerClusterer(baidu_map)

  refresh_map = ->
    $.ajax
      type: 'get'
      dataType: 'json'
      
      success: (clients)->
        markerClusterer.clearMarkers()
        markers = []
        for client in clients
          continue if client.lon == undefined || client.lat == undefined

          # point = new BMap.Point(parseFloat(client.lon), parseFloat(client.lat))
          point = new BMap.Point(Math.random() * 40 + 85, Math.random() * 30 + 21);
          marker = new BMap.Marker(point)
          markers.push(marker)
          label = "#{client.label}\n今日距离#{client.distance}"
          marker.setLabel(new BMap.Label(label,{offset:new BMap.Size(10,-10)}));

        markerClusterer.addMarkers(markers)

  refresh_map()
  setInterval(refresh_map, 10000)




