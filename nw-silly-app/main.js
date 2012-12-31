irc = require('irc')

nickname = 'nicknamegoeshere'
clients = {}

function getChannelPane (server, channel) {
    return $('#' + server + '\\' + channel)
}

function connect (server, port, ssl) {
    c = new irc.Client(server, nickname, {
        'port': port ? port : 6667,
        'secure': ssl ? true : false,
    });

    // set up event handlers
    c.on('message', function(dest, to, text, message) {
        if (dest === nickname) {
            // handle private message
        }
    });

    c.on('message#', function(dest, to, text, message) {
        
    });

    c.on('join', function(channel, nick, message) {
        if (nick == nickname) {
            $('<li><a href="#">' + channel + '</a></li>').appendTo('#channel-nav');
            $('<div class="tab-pane" id="' + server + '\\' + channel + '"></div>').appendTo('#channel-tabs')
        }
    });

    c[server] = c;
}

function joinChannel (server, channel) {
    // doesn't look like this supports channels with keys
    // might have to replace this func
    c[server].join(channel)
}

function partChannel (server, channel) {
    c[server].part(channel)
}

function cycleChannel (server, channel) {
    c[server].join(channel)
    c[server].part(channel)
}
