class @Game
    canvas: null
    context: null
    
    constructor: (@canvas) ->
        this.context = canvas.getContext("2d")
    
    run: =>
        this.update()
        this.draw(this.context)

    update: =>
        window.setTimeout(this.update, 0)

    draw: () =>
        window.requestAnimFrame(this.draw, 0)

        this.context.fillStyle = '#000000'
        this.context.fillRect(0, 0, this.canvas.width, this.canvas.height)
