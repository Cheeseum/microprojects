sound = (->

  # dictionary of sound files
  soundFiles = {}

  # element to append the audio files to
  parent = null
  showError = (err) ->
    console.log err

  sound =
    init: (p) ->
      parent = p

    isRegistered: (name) ->
      typeof soundFiles[name] isnt "undefined"

    isPaused: (name) ->
      return soundFiles[name].paused  if sound.isRegistered(name)
      false

    setVolume: (name, vol) ->
      if sound.isRegistered(name)
        s = soundFiles[name]
        s.volume = vol
        s.volume = soundFiles[name].volume

    increaseVolume: (name, amount) ->
      amount = amount or 0.1
      if sound.isRegistered(name)
        s = soundFiles[name]
        s.volume += amount
        s.volume = soundFiles[name].volume

    decreaseVolume: (name, amount) ->
      sound.increaseVolume name, -amount

    play: (name, loop_) ->
      unless sound.isRegistered(name)
        showError name + " is not registered in the sound module!"
        return
      s = soundFiles[name]
      loop_ = loop_ or false

      # audio element is null OR audio hasn't stopped playing
      if s.audioElement is null or not s.audioElement.ended
        if s.audioElement isnt null

          # get ready to delete the element that is currently
          # playing the sound once it finished
          s.audioElement.addEventListener "ended", ->
            parent.removeChild this

        s.audioElement = document.createElement("audio")
        s.audioElement.setAttribute "src", s.src
        s.audioElement.volume = s.volume
        s.audioElement.setAttribute "loop", ""  if loop_
        parent.appendChild s.audioElement
      s.audioElement.play()
      s.playing = true
      s.paused = false
      s.stopped = false

    pause: (name) ->
      unless sound.isRegistered(name)
        showError name + " is not registered in the sound module!"
        return
      s = soundFiles[name]
      s.audioElement.pause()
      s.paused = true

    stop: (name) ->
      unless sound.isRegistered(name)
        showError name + " is not registered in the sound module!"
        return
      s = soundFiles[name]
      if s.audioElement
        parent.removeChild s.audioElement
        s.audioElement = null
        s.stopped = true

    stopAll: ->
      soundName = undefined
      for soundName of soundFiles
        sound.stop soundName

    register: (name, file) ->
      if sound.isRegistered(name)
        showError name + " is already registered!"
        return
      soundFiles[name] =
        src: file
        stopped: true
        paused: false
        volume: 0.5
        audioElement: null

  sound
())
