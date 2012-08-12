class @Creature

    constructor: (@world) ->
        @status = constants.CreatureStatus.bored
        @hunger = constants.maxHunger
        @happiness = 0
        @age = 0

    eat: (value) =>
        @hunger += value
        @hunger = constants.maxHunger if @hunger >= constants.maxHunger

        @world.updateView(this)

    increaseHappiness: (value) =>
        @happiness += value
        @happiness = constants.maxHappiness if @hunger >= constants.maxHappiness

        @world.updateView(this)

    update: =>
