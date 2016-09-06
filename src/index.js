'use strict';

// require('ace-css/css/ace.css');
// require('font-awesome/css/font-awesome.css');

// Require index.html so it gets copied to dist
require('./index.html');

var Elm = require('./Main.elm');


// The third value on embed are the initial values for incomming ports into Elm
Elm.Main.fullscreen();
