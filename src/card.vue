// out: ..
<template lang="pug">
div(:class="computedClass",:style="computedStyle")
  div.card-image(v-if="hasImage" @click="toggle",:style="pointer")
    slot(name="img")
  div.card-content
    span.card-title(@click="toggle",:style="pointer")
      slot(name="title")
    slot
  div.card-reveal(
    v-if="hasReveal && opened",
    :transition="cTransition",
    style="display:block;width:100%;height:100%;position:absolute",
    :style="mergeRStyle"
    )
    span.card-title(@click="toggle",:style="pointer")
      slot(name="revealTitle")
    slot(name="reveal")
  div.card-action(v-if="hasAction")
    slot(name="action")
</template>

<script lang="coffee">
trim = (str) -> return str.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, '')
module.exports =
  mixins: [
    require("vue-mixins/isOpened")
    require("vue-mixins/class")
    require("vue-mixins/style")
    require("vue-mixins/transition")
  ]

  props:
    class:
      default: -> []
    style:
      default: -> []
    revealStyle:
      default: ""
      coerce: (val) ->
        if typeof val == 'string' or val instanceof String
          obj = {}
          for opt in val.split(";")
            kv = opt.split(":")
            if kv.length == 2
              obj[trim(kv[0])] = trim(kv[1])
          return obj
        return obj
    zIndex:
      type: Number
      default: 50
    transition:
      type: String
      default: "card"

  computed:
    pointer: ->
      if @hasReveal
        return cursor: "pointer"
      return {}
    mergeStyle: ->
      position:'relative'
      overflow:'hidden'
    mergeClass: -> ["card"]
    mergeRStyle: ->
      return [
        {
          height: @$el.clientHeight + "px"
          zIndex: @zindex
        }
        @revealStyle
        @rStyle
      ]
    hasImage: -> @_slotContents.img?
    hasReveal: -> @_slotContents.revealTitle?
    hasAction: -> @_slotContents.action?

  data: ->
    rStyle:
      top:0

  methods:
    toggle: (e) ->
      return unless @hasReveal
      if e?
        return if e.defaultPrevented
        e.preventDefault?()
      if @opened
        @setClosed()
      else
        @setOpened()

</script>
