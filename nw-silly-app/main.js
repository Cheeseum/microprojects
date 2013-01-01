global.$ = $;

irc = require('nw-irc')
ircui = require('nw-irc-ui')

var clients = {};

var ui = new ircui.ClientUI();

function addServer (server, nickname, opts) {
    c = new irc.Client(server, nickname, opts);
    ui.initClient(c);
    clients[server] = c;
}

function connectToServer (server) {
    if (clients[server])
        clients[server].connect();
}

onload = function () {
    $('#server-menu').fadeIn();
    // TODO: form validation
    $('#server-menu').find('button').on('click', function (e) {
        addServer(
            $('#inputServerAddress').val(),
            $('#inputServerNickname').val(),
            { port: $('#inputServerPort').val(),
              selfSigned: true,
              secure: $('#checkboxServerSecure:checked').length,
              password: $('#inputServerPassword').val()
            }
        );
        $('#server-menu').find('form')[0].reset();
        $('#server-menu').fadeOut();

        return false;
    });
}
