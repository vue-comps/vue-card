// out: ..
<template lang="jade">
div(@click="click | notPrevented | prevent")
  slot
</template>

<script lang="coffee">

module.exports =

  filters:
    notPrevented: require("vue-filters/notPrevented")
    prevent: require("vue-filters/prevent")

  methods:
    click: -> @$dispatch "toggle"

  events:
    toggle: -> true

</script>
