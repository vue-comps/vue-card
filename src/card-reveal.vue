// out: ..
<template lang="jade">
div(:class="class",:style="style")
  slot
</template>

<script lang="coffee">

module.exports =

  props:
    class:
      default: -> ["card-reveal"]
    zIndex:
      type: Number
      default: 50
    transition:
      type: Function
      default: ({el,style,cb}) ->
        @style.height = style.height + 'px'
        @style.top = style.top + 'px'
        @style.opacity = style.opacity
        cb()

  data: ->
    style:
      height: 0
      width: "100%"
      position: "relative"
      top: 0
      opacity: 0
      display: "none"
      overflow: "hidden"
      zIndex: @zIndex
    opened: false
    top: 0
    padding: 0

  methods:
    show: (cb) ->
      cb()
      @$emit "before-open"
      @style.display = "block"
      @opened = true
      @$nextTick =>
        @top = @$el.offsetTop
        @padding = @$el.clientHeight
        @style.position = "absolute"
        @style.top = @top - @padding + 'px'
        @$nextTick =>
          @transition el: @$el, style:{height:@top,top:0,opacity:1}, cb: =>
            @$emit "opened"


    hide: (cb) ->
      @$emit "before-close"
      @transition el:@$el, style:{height:0,top:@top-@padding,opacity:0}, cb:=>
        @$emit "closed"
        @opened = false
        @style.display = "none"
        @style.position = "relative"
        @style.top = 0
        cb()

    toggle: (cb) ->
      if @opened
        @hide(cb)
      else
        @show(cb)

  events:
    toggleReveal: (cb) ->
      @toggle(cb)
      return true

</script>
