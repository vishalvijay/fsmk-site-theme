window.FSMK = {}
$ ->
  jQuery.fn.cssInt = (prop) ->
    parseInt(@css(prop), 10) or 0
  FSMK.app = new FSMK.App()
  FSMK.app.initialize()