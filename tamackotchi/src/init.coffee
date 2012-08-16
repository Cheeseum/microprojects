$ =>

    @sound.init($ "#main-container");

    g = new @Game(this)


    ($ "#feed-pet").click =>
        g.feedPet {value: 10}

    g.run()

