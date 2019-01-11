var exec = require('cordova/exec');
var videoStreamer = {};

videoStreamer.streamRTMP = function(uri, success, failure) {
    // fire
    exec(
        success,
        failure,
        'CordovaRTMPiOS',
        'streamRTMP',
        [uri]
    );
};

videoStreamer.streamRTMPAuth = function(uri, username, password, success, failure) {
    // fire
    exec(
        success,
        failure,
        'CordovaRTMPiOS',
        'streamRTMPAuth',
        [uri, username, password]
    );
};

videoStreamer.streamStop = function(success, failure) {
    // fire
    exec(
        success,
        failure,
        'CordovaRTMPiOS',
        'streamStop',
        []
    );
};

videoStreamer.echo = function(arg0, success, error) {
    exec(success, error, "CordovaRTMPiOS", "echo", [arg0]);
};

module.exports = videoStreamer;