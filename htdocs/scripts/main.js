var le;

le = angular.module('lechiffre', []);

le.directive('note', function() {
  return {
    restrict: 'E',
    templateUrl: 'templates/note.html',
    scope: true
  };
});

var data;

data = {
  notes: [
    {
      title: 'An example note',
      body: 'You can collect your thoughts here.',
      tags: ['example', 'note']
    }
  ],
  tags: ['example', 'note']
};
