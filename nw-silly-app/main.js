global.$ = $;

var irc = require('nw-irc');
var ircui = require('nw-irc-ui');

var clients = {};

var ui = new ircui.ClientUI();

function addServer(server, nickname, opts) {
    var c = new irc.Client(server, nickname, opts);
    ui.initClient(c);
    clients[server] = c;
}

function connectToServer(server) {
    if (clients[server]) {
        clients[server].connect();
    }
}

window.onload = function () {
    $('#server-menu').fadeIn();
    // TODO: form validation
    $('#server-menu').find('button').on('click', function (e) {
        addServer(
            $('#input-server-address').val(),
            $('#input-server-nickname').val(),
            {
                port: $('#input-server-port').val(),
                selfSigned: true,
                secure: $('#checkbox-server-secure:checked').length,
                password: $('#input-server-password').val()
            }
        );
        $('#server-menu').find('form')[0].reset();
        $('#server-menu').fadeOut();

        return false;
    });
}
