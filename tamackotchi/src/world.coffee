class @World
    constructor: ->
        @creatures = []

    addCreature: (c) =>
        @creatures.push(c)

    update: =>
        c.update() for c in @creatures

