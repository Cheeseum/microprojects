constants = @constants

class @Creature

    constructor: (@world) ->
        @status = constants.CreatureStatus.neutral
        @hunger = constants.maxHunger
        @happiness = constants.maxHappiness / 2
        @age = 0

    eat: (value) =>
        @hunger += value
        if @hunger >= constants.maxHunger
            @hunger = constants.maxHunger
            @happiness -= 20

        @world.updateView(this)

    increaseHappiness: (value) =>
        @happiness += value
        @happiness = constants.maxHappiness if @hunger >= constants.maxHappiness

        @world.updateView(this)

    decreaseHappiness: (value) =>
        @happiness -= value
        @happiness = 0 if @happiness < 0

        @world.updateView(this)

    update: =>
        @decreaseHappiness(0.5)
