$ ->

  @requestAnimFrame =
    @requestAnimationFrame or
    @webkitRequestAnimationFrame or
    @mozRequestAnimationFrame    or
    @oRequestAnimationFrame      or
    @msRequestAnimationFrame     or
    (callback) -> @setTimeout callback, 1000 / 60;

  @sound.init($ "#main-container");

  g = new @Game()
  g.run()

