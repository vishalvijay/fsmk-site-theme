class FSMK.App

  initialize: ->
    U.resize @onResize
    @onResize()
    @tileAnimation()

  onResize: =>
    @fixImportantPanelHeight()

  fixImportantPanelHeight: ->
    panels = $(".important .panel")
    panels.removeAttr "style"
    unless U.isScreen()
      maxHeight = Math.max.apply null, panels.map(->
        $(this).outerHeight()
      ).get()
      panels.css("min-height", maxHeight)

  tileAnimation: ->
    $(".tile .overlay").hover ->
      $(".content", $(this)).addClass 'animated fadeInUp'
    , ->
      $(".content", $(this)).removeClass('animated fadeInUp')