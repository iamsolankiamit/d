import DS from 'ember-data';

export default DS.Model.extend({
  movie_file_name: DS.attr('string'),
  movie_content_type: DS.attr('string'),
  playlistRelation: DS.belongsTo('playlist')
});
