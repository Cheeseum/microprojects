irc = require('nw-irc')
ircui = require('nw-irc-ui')

clients = {}
channel_panes = {}

ui = new ircui.ClientUI();

exports.addServer (server, opts) {
    c = irc.Client.init(server, opts);
    ui.initClient(c);
    clients[server] = c;
}

exports.connectToServer (server) {
    if (clients[server])
        clients[server].connect();
}
