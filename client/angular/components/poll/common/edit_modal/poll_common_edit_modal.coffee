Records = require 'shared/services/records.coffee'

{ iconFor }       = require 'shared/helpers/poll.coffee'
{ applySequence } = require 'shared/helpers/apply.coffee'

angular.module('loomioApp').factory 'PollCommonEditModal', ->
  templateUrl: 'generated/components/poll/common/edit_modal/poll_common_edit_modal.html'
  controller: ['$scope', 'poll', ($scope, poll) ->
    $scope.poll = poll.clone()

    $scope.icon = ->
      iconFor($scope.poll)

    applySequence $scope,
      steps: ['save', 'announce']
      saveComplete: (_, poll) ->
        $scope.announcement = Records.announcements.buildFromModel(poll, 'poll_edited')
  ]
