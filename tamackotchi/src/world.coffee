class @World
    constructor: ->
        @creatures = []

    add_creature: (c) =>
        @creatures.push(c)

    update: =>
        c.update() for c in @creatures

