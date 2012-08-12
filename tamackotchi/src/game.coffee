class @Game
    constructor: (@root) ->
        @world = new World()

        @loveBar = $ "#love-bar"
        @hungerBar = $ "#hunger-bar"

    run: =>
        @pet = new Creature(this)
        @world.add_creature(@pet)
        @update()

    update: =>
        @world.update()
        @root.setTimeout(@update, 0)

    updateView: (pet) =>
        @loveBar.css {width: "#{pet.happiness}%"}
        @hungerBar.css {width: "#{pet.hunger}%"}
