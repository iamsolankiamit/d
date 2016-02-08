import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('playlists', {path: '/playlists'}, function() {
  	this.resource('playlist', {path: '/:id'});
  });
  this.route('groups', {path: '/groups'});
  this.route('videos', {path: '/videos'});
});

export default Router;
