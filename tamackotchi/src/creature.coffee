class @Creature

    constructor: ->
        @status = constants.CreatureStatus.bored
        @hunger = constants.maxHunger
        @happiness = 0
        @age = 0

    eat: (value) =>
        @hunger += value
        @hunger = constants.maxHunger if @hunger >= constants.maxHunger

    increaseHappiness: (value) =>
        @happiness += value
        @happiness = constants.maxHappiness if @hunger >= constants.maxHappiness

    update: =>
