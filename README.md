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
  "card": require("vue-card/card")
  "card-reveal": require("vue-card/card-reveal")
  "card-toggle": require("vue-card/card-toggle")
# or, when using bundle.js
components:
  "card": window.vueComps.card
  "card-reveal": window.vueComps.cardReveal
  "card-toggle": window.vueComps.cardToggle
```
```html
<card>
  <card-toggle>
    // some image
  </cards-toggle>
  <div>
    <card-toggle>The title</card-toggle>
    some short content
  </div>
  <card-reveal>
    <card-toggle>The revealed title</card-toggle>
    The revealed content
  </card-reveal>
</card>
```
For examples see [`dev/`](https://github.com/vue-comps/vue-card/tree/master/dev).

#### Props
card

| Name | type | default | description |
| ---:| --- | ---| --- |
| class | Array or Object | ["card"] | class of the `div`|

card-reveal

| Name | type | default | description |
| ---:| --- | ---| --- |
| class | Array or Object | ["card-reveal"] | class of the `div`|
| z-index | Number | 50 | z-index of the `div` |
| transition | function | no animation | used to animate the `div`. Arguments: `{el,style,cb}` |

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
