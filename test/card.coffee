env = null
card = null
clickNWait = (el,cb) ->
  e = new MouseEvent("click",{
    "view": window,
    "bubbles": true,
    "cancelable": true
  })
  el.dispatchEvent(e)
  env.$nextTick -> cb()

describe "card", ->

  describe "basic env", ->

    before ->
      env = loadComp(require("../dev/basic.vue"))
      card = env.$refs.card
    after ->
      unloadComp(env)

    it "should work on click on image", (done) ->
      card.opened.should.be.false
      card.$el.children.length.should.equal 2
      clickNWait card.$el.children[0], ->
        card.opened.should.be.true
        card.$el.children.length.should.equal 3
        clickNWait card.$el.children[2].firstChild, ->
          card.opened.should.be.false
          card.$once "after-leave", ->
            card.$el.children.length.should.equal 2
            done()

    it "should work on click on title", (done) ->
      card.opened.should.be.false
      card.$el.children.length.should.equal 2
      clickNWait card.$el.children[1].firstChild, ->
        card.opened.should.be.true
        card.$el.children.length.should.equal 3
        clickNWait card.$el.children[2].firstChild, ->
          card.opened.should.be.false
          card.$once "after-leave", ->
            card.$el.children.length.should.equal 2
            done()
