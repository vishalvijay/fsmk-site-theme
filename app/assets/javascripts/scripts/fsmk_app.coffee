class FSMK.App

  initialize: ->
    U.resize @onResize
    @onResize()
    @makeTileBlink()
    @makeMap()
    U.enableValidation $("#contact-us-form")
    @animateLogo()

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
    map = L.map('map').setView([
      12.9473557
      77.5996612
    ], 13)

    marker = L.marker([
      12.9473557
      77.5996612
    ]).addTo(map)
    marker.bindPopup('<b>FSMK Office</b><br>121/17, 12th Cross, Mavalli, Wilson Garden,<br>Bangalore, Bangalore Urban,<br> Karnataka, 560030, India.').openPopup()

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