<template lang="jade">
.container
  card(style="display:inline-block")
    card-toggle
      img(src="http://materializecss.com/images/office.jpg",width=200)
    card-toggle(style="border:1px solid black") Title (click me)
    .card-content Some Content
    card-reveal(style="background-color:white")
      card-toggle(style="border:1px solid black") Title (click me)
      .card-content Significantly more Content
  p
    a(href="https://github.com/vue-comps/vue-card/blob/master/dev/basic.vue") source
</template>

<script lang="coffee">
module.exports =
  components:
    "card" : require "../src/card.vue"
    "card-reveal" : require "../src/card-reveal.vue"
    "card-toggle" : require "../src/card-toggle.vue"

</script>
