class FSMK.App

  initialize: ->
    U.resize @onResize
    @onResize()
    @makeTileBlink()
    @makeMap()
    U.enableValidation $("#contact-us-form")

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
    marker.bindPopup('<b>FSMK Office</b><br>121/17, 12th Cross, Mavalli, Wilson Garden, Bangalore, Bangalore Urban, Karnataka, 560030, India.').openPopup()