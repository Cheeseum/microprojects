global.$ = $;

irc = require('nw-irc')
ircui = require('nw-irc-ui')

var clients = {};

var nickname = 'Cheeseum';
var ui = new ircui.ClientUI();

function addServer (server, opts) {
    c = new irc.Client(server, nickname, opts);
    ui.initClient(c);
    clients[server] = c;
}

function connectToServer (server) {
    if (clients[server])
        clients[server].connect();
}

//addServer('raspberrypi', { port: 2929, selfSigned: true, secure: true, password: '[REDACTED]' });
