class @Game
    constructor: (@root) ->
        @world = new World()

        @loveBar = $ "#love-bar"
        @hungerBar = $ "#hunger-bar"

    run: =>
        @pet = new Creature(this)
        @world.addCreature(@pet)
        @update()

    update: =>
        @world.update()
        @root.setTimeout(@update, 500)

    updateView: (pet) =>
        if pet == @pet
            @loveBar.css {width: "#{pet.happiness}%"}
            @hungerBar.css {width: "#{pet.hunger}%"}
