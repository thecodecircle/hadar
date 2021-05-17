const { resolve } = require('path');
const { config, environment, Environment } = require('@rails/webpacker');
const erb = require('./loaders/erb')
const WebpackerPwa = require('webpacker-pwa');
new WebpackerPwa(config, environment);
environment.loaders.prepend('erb', erb)
module.exports = environment;
