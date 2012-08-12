class @Game
    constructor: (@root) ->
        @world = new World()

        @lovebar = document.getElementById("love-bar")
        @hungerbar = document.getElementById("hunger-bar")

    run: =>
        @pet = new Creature()
        @world.add_creature(@pet)
        @update()

    update: =>
        @world.update()

        ### consumes too much cpu
        @lovebar.style.width = "#{@pet.happiness}%"
        @hungerbar.style.width = "#{@pet.hunger}%"
        ###
        
        @root.setTimeout(@update, 0)
