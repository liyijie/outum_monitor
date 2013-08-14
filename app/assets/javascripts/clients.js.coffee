# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/  

cnLanguage =  
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

$ ->
  $('#clients').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    # "sScrollY": "600px"
    # iDisplayLength: 15
    aaSorting: [[ 2, "desc" ]]
    aLengthMenu: [[10, 20, 50, 100, -1], ["10", "20", "50", "100", "全部"]] 
    oLanguage: cnLanguage

$ ->
  $('#records').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    # "sScrollY": "600px"
    # iDisplayLength: 15
    aLengthMenu: [[10, 20, 50, 100, -1], ["10", "20", "50", "100", "全部"]] 
    oLanguage: cnLanguage




