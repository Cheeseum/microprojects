class @World
    creatures: []

    update: =>
        for c in this.creatures
            c.update()

