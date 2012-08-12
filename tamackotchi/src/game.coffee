class @Game
    root: null
    world: null

    constructor: (root) ->
        @world = new World()

    run: =>
        @world.add_creature(new Creature())
        @update()

    update: =>
        @world.update()
        @root.setTimeout(@update, 0)
