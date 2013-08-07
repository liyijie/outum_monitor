# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# // 百度地图API功能
baidumap_init = ->
  map = new BMap.Map("allmap")
  point = new BMap.Point(116.404, 39.915)
  map.centerAndZoom(point, 15)
  map.addControl(new BMap.NavigationControl())

  # // 编写自定义函数,创建标注
  addMarker = (point) ->
    marker = new BMap.Marker(point)
    map.addOverlay(marker)

  # // 随机向地图添加25个标注
  bounds = map.getBounds()
  sw = bounds.getSouthWest()
  ne = bounds.getNorthEast()
  lngSpan = Math.abs(sw.lng - ne.lng)
  latSpan = Math.abs(ne.lat - sw.lat)
  point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7))
  addMarker(point)
  point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7))
  addMarker(point)
  point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7))
  addMarker(point)
  point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7))
  addMarker(point)
  point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7))
  addMarker(point)
  point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7))
  addMarker(point)

$(document).ready(baidumap_init)


