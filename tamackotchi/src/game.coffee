class @Game
    world: null
    
    constructor: () ->
        this.world = new World()
    
    run: =>
        this.world.add_creature(new Creature())
        this.update()
        this.draw(this.context)

    update: =>
        this.world.update()
        window.setTimeout(this.update, 0)

    draw: =>
        window.requestAnimFrame(this.draw, 0)
