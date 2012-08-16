constants = @constants

class @Creature

    constructor: (@world) ->
        @status = constants.CreatureStatus.neutral
        @hunger = constants.maxHunger
        @happiness = constants.maxHappiness / 2
        @age = 0

    increase: (attr, value, max) ->
        attr += value
        attr = max if attr > max
        return attr

    decrease: (attr, value, min) ->
        attr -= value
        attr = min if attr < min
        return attr

    eat: (value) =>
        if @hunger + value >= constants.maxHunger
            @decreaseHappiness(20)
        else
            @increaseHappiness(5)

        @increaseHunger(value)

        @world.updateView(this)

    increaseHappiness: (value) =>
        @happiness = @increase(@happiness, value, constants.maxHappiness)
        @world.updateView(this)

    decreaseHappiness: (value) =>
        @happiness = @decrease(@happiness, value, 0)
        @world.updateView(this)

    increaseHunger: (value) =>
        @hunger = @increase(@hunger, value, constants.maxHunger)
        @world.updateView(this)

    decreaseHunger: (value) =>
        @hunger = @decrease(@hunger, value, 0)
        @world.updateView(this)

    update: =>
        @decreaseHappiness(0.5)
        @decreaseHunger(0.5)
