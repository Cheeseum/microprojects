@sound = (=>
  # dictionary of sound files
  _soundFiles = {}

  # element to append the audio files to
  _parent = null

  _showError = (err) =>
    @console.log err

  init = (p) =>
    _parent: p

  isRegistered = (name) =>
    _soundFiles[name]?

  isPaused = (name) =>
    if isRegistered(name) then _soundFiles[name].paused
    else false

  setVolume = (name, vol) =>
    if isRegistered(name)
      s = _soundFiles[name]
      s.volume = vol
      s.volume = _soundFiles[name].volume

  increaseVolume = (name, amount) =>
    amount = amount ? 0.1

    if isRegistered(name)
      s = _soundFiles[name]
      s.volume += amount
      s.volume = _soundFiles[name].volume

  decreaseVolume = (name, amount) =>
    increaseVolume(name, -amount)

  play = (name, loop_) =>
    unless isRegistered(name)
      showError name + " is not registered in the sound module!"
      return

    s = _soundFiles[name]
    loop_ = loop_ ? false

    # audio element is null OR audio hasn't stopped playing
    if s.audioElement is null or not s.audioElement.ended
      if s.audioElement isnt null

        # get ready to delete the element that is currently
        # playing the sound once it finished
        s.audioElement.addEventListener "ended", ->
          _parent.removeChild this

      s.audioElement = @document.createElement("audio")
      s.audioElement.setAttribute "src", s.src
      s.audioElement.volume = s.volume

      if loop_
        s.audioElement.setAttribute "loop_", ""

      _parent.appendChild s.audioElement

    s.audioElement.play()
    s.playing = true
    s.paused = false
    s.stopped = false

  pause = (name) =>
    unless isRegistered(name)
      showError name + " is not registered in the sound module!"
      return

    s = _soundFiles[name]
    s.audioElement.pause()
    s.paused = true

  stop = (name) =>
    unless isRegistered(name)
      showError name + " is not registered in the sound module!"
      return

    s = _soundFiles[name]
    if s.audioElement
      _parent.removeChild s.audioElement
      s.audioElement = null
      s.stopped = true

  stopAll = =>
      stop soundName for soundName in _soundFiles
      return

  register = (name, file) =>
    if (name of _soundFiles)
      showError name + " is already registered!"
      return

    _soundFiles[name] =
      src: file
      stopped: true
      paused: false
      volume: 0.5
      audioElement: null

    return

  init: init,
  isRegistered: isRegistered,
  register: register,
  isPaused: isPaused,
  setVolume: setVolume,
  increaseVolume: increaseVolume,
  decreaseVolume: decreaseVolume,
  play: play,
  pause: pause,
  stop: stop,
  stopAll: stopAll
)()
