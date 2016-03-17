class FSMK.App

  initialize: ->
    U.resize @onResize
    @onResize()
    @makeTileBlink()
    @makeMap()
    U.enableValidation $("#contact-us-form")
    @animateLogo()
    @fixThumbnailHeight()

  onResize: =>

  makeTileBlink: ->
    blinkIndex = 0
    setInterval ->
      unless U.isScreen()
        tileMenu = $(".tile_menu")
        $(".active", tileMenu).removeClass "active"
        tileCol = $(".tile-col", tileMenu)
        active = $(tileCol[blinkIndex++%tileCol.length])
        active.addClass "active" if active
    , 1000

  makeMap: ->
    map = L.map('map').setView([12.9473557, 77.5996612], 16)
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors').addTo map
    contentString = '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h3 id="firstHeading" class="firstHeading">FSMK Office</h3>'+
      '<div id="bodyContent">'+
      '<p>121/17, 12th Cross, Mavalli, Wilson Garden,<br>Bangalore, Bangalore Urban,<br> Karnataka, 560030, India</p>'+
      '</div>'+
      '</div>';
    L.marker([12.9473557, 77.5996612]).addTo(map).bindPopup(contentString).openPopup()

  animateLogo: ->
    repositon = ->
      top = -20
      maxHeight = 96
      ratio = 10
      windowTop = $(window).scrollTop()
      logo = $(".nav-logo img")
      currentTop = logo.cssInt("top")
      currentMaxHeight = logo.cssInt("max-height")
      newMaxHeigth = maxHeight - (windowTop/ratio)
      newMaxHeigth = 46 if newMaxHeigth < 46
      newTop = -20 + (windowTop/ratio)
      newTop = 0 if newTop > 0
      logo.css "max-height", newMaxHeigth
      logo.css "top", newTop
    $(window).scroll ->
      repositon()
    repositon()

  fixThumbnailHeight: ->
    thumbnails = $(".thumbnail")
    while thumbnails.length
      thumb = thumbnails.first()
      parent = thumb.parent()
      while parent.children().length is 1
        parent = parent.parent()
      new_thumbnails = $(".thumbnail", parent)
      maxHeight = 0
      new_thumbnails.each (i, item) ->
        index = $.inArray(item, thumbnails)
        if index > -1
          thumbnails.splice(index, 1)
        height = new_thumbnails.eq(i).height()
        if height > maxHeight
          maxHeight = height
      new_thumbnails.height(maxHeight)