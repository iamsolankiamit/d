import Ember from 'ember';

export default Ember.Route.extend({
	renderTemplate: function() {
      this.render('playlist', { into: 'application' });
  },
	model: function(params) {
    	return this.store.find('playlist', params.id);}
});