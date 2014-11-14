class FSMK.App

  initialize: ->
    U.resize @onResize
    @onResize()

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
