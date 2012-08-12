class @Game
    canvas: null
    context: null
    world: null
    
    constructor: (@canvas) ->
        this.context = canvas.getContext("2d")
        this.world = new World()
    
    run: =>
        this.update()
        this.draw(this.context)

    update: =>
        this.world.update()
        window.setTimeout(this.update, 0)

    draw: () =>
        window.requestAnimFrame(this.draw, 0)

        this.context.fillStyle = '#000000'
        this.context.fillRect(0, 0, this.canvas.width, this.canvas.height)
