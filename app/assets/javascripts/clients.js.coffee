# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  baidu_map = new BMap.Map("allmap")
  point = new BMap.Point(119.1586, 26.08087)
  baidu_map.centerAndZoom(point, 8)
  baidu_map.addControl(new BMap.NavigationControl())

  refresh_map = ->
    $.ajax
      type: 'get'
      dataType: 'json'
      url: '/clients'
      
      success: (clients)->
        baidu_map.clearOverlays()
        for client in clients
          point = new BMap.Point(parseFloat(client.lon), parseFloat(client.lat))
          marker = new BMap.Marker(point)
          baidu_map.addOverlay(marker)

  refresh_map()
  setInterval(refresh_map, 10000)
  

$ ->
  $('#clients').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    # "sScrollY": "600px"
    # iDisplayLength: 15
    aLengthMenu: [[10, 20, 50, 100, -1], ["10", "20", "50", "100", "全部"]] 

    oLanguage:  
      "sLengthMenu": "每页显示 _MENU_ 条记录"
      "sZeroRecords": "对不起，查询不到任何相关数据"
      "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录"
      "sInfoEmtpy": "找不到相关数据"
      "sInfoFiltered": "数据表中共为 _MAX_ 条记录)"
      "sProcessing": "正在加载中..."
      "sSearch": "搜索"
      "sUrl": ""  #可以保存的配置文件路径
      "oPaginate":
        "sFirst":    "第一页"
        "sPrevious": " 上一页 "
        "sNext":     " 下一页 "
        "sLast":     " 最后一页 "




