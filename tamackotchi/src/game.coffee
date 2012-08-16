class @Game
    constructor: (@root) ->
        @world = new World()

        @loveBar = $ "#love-bar"
        @hungerBar = $ "#hunger-bar"

    run: =>
        @pet = new Creature(this)
        @world.addCreature(@pet)
        @update()

    feedPet: (food) =>
        @pet.eat(food.value)

    update: =>
        @world.update()
        @root.setTimeout(@update, 500)

    updateView: (pet) =>
        if pet == @pet
            @loveBar.css {width: "#{pet.happiness}%"}
            if @pet.happiness <= 25
                $("#love-icon").removeClass("love-icon-high")
                $("#love-icon").addClass("love-icon-low")
            else unless $("#love-icon").hasClass("love-icon-high")
                $("#love-icon").removeClass("love-icon-low")
                $("#love-icon").addClass("love-icon-high")

            @hungerBar.css {width: "#{pet.hunger}%"}
