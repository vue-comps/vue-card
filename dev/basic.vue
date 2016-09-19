<template lang="pug">
.container
  card(reveal-style="background-color:white",v-ref:card)
    img(slot="img" src="http://materializecss.com/images/office.jpg",width=200)
    span(slot="title") Title (click me)
    p Some Content
    span(slot="revealTitle")  Title (click me)
    p(slot="reveal") Significantly more Content
  p
    a(href="https://github.com/vue-comps/vue-card/blob/master/dev/basic.vue") source
</template>

<script lang="coffee">
Velocity = require("velocity-animate")
cancel = (el) -> Velocity el, "stop"
module.exports =
  components:
    "card" : require "../src/card.vue"
  transitions:
    card:
      css: false
      leaveCancelled: cancel
      enterCancelled: cancel
      beforeEnter: ->
        height = @$el.clientHeight
        @rStyle.top = height + "px"
        @rStyle.opacity = 0
      enter: (el,done) ->
        @$nextTick ->
          Velocity el, {top: 0, opacity: 1},{
            duration: 1000
            easing: "easeOutQuart"
            queue: false
            complete: done
            }
      leave: (el,done) ->
        height = el.parentElement.clientHeight
        Velocity el, {top: height+"px", opacity: 0},{
          duration: 350
          easing: "easeOutQuart"
          queue: false
          complete: done
          }
</script>
