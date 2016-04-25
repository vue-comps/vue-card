// out: ..
<template lang="jade">
div(:class="class",:style="{height:height,position:'relative',overflow:'hidden'}")
  slot No content
</template>

<script lang="coffee">
module.exports =

  props:
    "class":
      default: -> ["card"]

  data: ->
    opened: false

  computed:
    height: ->
      if @opened
        return @$el.clientHeight+'px'
      else
        return null

  methods:
    toggle: ->
      @$broadcast "toggleReveal", =>
        @opened = !@opened

  events:
    toggle: ->
      @toggle()
      true
</script>
