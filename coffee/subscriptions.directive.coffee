###
# Copyright (C) 2019 Tuesmon LLC
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# File: subscriptions.directive.coffee
###

module = angular.module('subscriptions')

SubscriptionsDirective = ($rootScope) ->
    link = (scope, el, attrs, ctrl) ->
        ctrl.init()

        $rootScope.$on '$translateChangeSuccess', () =>
            ctrl._loadMetas()

    return {
        scope: {},
        controller: "ContribSubscriptionsController",
        controllerAs: "vm",
        templateUrl: 'compile-modules/tuesmon-contrib-subscriptions/partials/subscriptions.html'
        link: link
    }

SubscriptionsDirective.$inject = [
    "$rootScope"
]

module.directive("tgSubscriptions", SubscriptionsDirective)