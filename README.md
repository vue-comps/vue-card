# vue-card

A material design inspired card-reveal implementation - without styles.

### [Demo](https://vue-comps.github.io/vue-card)

# Install

```sh
npm install --save-dev vue-card
```
or include `build/bundle.js`.

## Usage
```coffee
# in your component
components:
  "card": require("vue-card")
# or, when using bundle.js
components:
  "card": window.vueComps.card
```
```html
<card>
  <img slot="img" src="..."></img>
  <span slot="title">The title</span>
  <p>The content</p>
  <span slot="revealTitle">The revealed title</span>
  <p slot="reveal">The revealed content</p>
</card>
```
For examples see [`dev/`](https://github.com/vue-comps/vue-card/tree/master/dev).

#### Props

Name | type | default | description
---:| --- | ---| ---
z-index | Number | 50 | z-index of the `div`
transition | String | "card" | name of a vue transition. [Detailed description](#transition)
revealStyle | Object / String | {} | style which will be passed down to reavel `div`
is-opened | Boolean | false | (two-way) set to open / close

#### slots

Name | description
---:| ---
default | content
title | will reveal on click
img | above title. will reveal on click
reveal | content of reveal
revealTitle | title of reveal. If absent, reveal will be disabled.
action | action div below

#### Events
Name |  description
---:| ---
before-enter | will be called before open animation
after-enter |  will be called when opened
before-leave |  will be called before close animation
after-leave |  will be called when closed
toggled(isOpened:Boolean) | emitted when gets opened or closed. Alternative to use two-way `is-opened` prop

#### Transition

You can provide a vue transition like this:
```js
Vue.transition("fade",{
  // your transition
})
// or in the instance:
transitions: {
  fade: {
    // your transition
  }
}
// usage:
template: "<card transition='fade'></card>"
```

You can write to the reveal style in your hooks (remeber it needs a tick to get applied):
```js
Velocity = require("velocity-animate")
beforeEnter: function() {
  height = this.$el.clientHeight
  this.rStyle.top = height + "px"
  this.rStyle.opacity = 0
  // content of this.rStyle overwrites content of this.revealStyle
},
enter: function(el,done) {
  this.$nextTick(function(){
    Velocity(el, {top: 0, opacity: 1},{
      duration: 1000,
      easing: "easeOutQuart",
      queue: false,
      complete: done
      })
  })
}
```

## Changelog
- 1.1.0  
set default transition  

- 1.0.0  
now using vue transitions  
events are renamed after vue transitions  
only using a single component now, with multiple slots  
added unit tests  

# Development
Clone repository.
```sh
npm install
npm run dev
```
Browse to `http://localhost:8080/`.

## License
Copyright (c) 2016 Paul Pflugradt
Licensed under the MIT license.
