class @World
    constructor: ->
        @creatures = []

    add_creature: (c) =>
        @creatures.push(c)

    update: =>
        for c in @creatures
            c.update()

