import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('playlists', {path: '/playlists'});
  this.route('groups', {path: '/groups'});
});

export default Router;
