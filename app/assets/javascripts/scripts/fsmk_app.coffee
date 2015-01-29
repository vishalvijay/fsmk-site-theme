class FSMK.App

  initialize: ->
    U.resize @onResize
    @onResize()
    @makeTileBlink()

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