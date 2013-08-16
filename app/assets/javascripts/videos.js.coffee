# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
grabVideoUrl = ->
  $("meta[name=video-url]").attr("content")

playVideo = ->
  url = grabVideoUrl()
  if url?
    $("#jquery_jplayer_1").jPlayer
      ready: ->
        $(this).jPlayer("setMedia", {
          m4v: url
        }).jPlayer('play')
      swfPath: "/assets"
      supplied: "m4v"
      smoothPlayBar: true
      keyEnabled: true
      size: {
        width: "640px",
        height: "360px",
        cssClass: "jp-video-360p"
      }

playControl = ->
  $("#player .watch").one 'click', (e) ->
    $("#jp_container_1").show()
    playVideo()

   $('#jquery_jplayer_1').bind 'click', (e) ->
    if $('.jp-play').is ':visible'
      $(this).jPlayer('play') 
    else
      $(this).jPlayer('pause')

$ ->
  playControl()
  if window.location.search.indexOf('autoplay=true') != -1
    $('#player .watch').click()