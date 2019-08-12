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
# File: lightbox-confirm-cancel-plan.directive.coffee
###

module = angular.module('subscriptions')

LightboxConfirmCancelPlanDirective = (lightboxService) ->
    return {
        scope: {
            plan: '=',
            currentPlan: '='
        },
        bindToController: true,
        controller: 'ContribLbConfirmCancelPlanController',
        controllerAs: 'vm',
        templateUrl: 'compile-modules/tuesmon-contrib-subscriptions/components/lb-confirm-cancel-plan/lightbox-confirm-cancel-plan.html',
    }

LightboxConfirmCancelPlanDirective.$inject = [
    "lightboxService"
]

module.directive("tgLbConfirmCancelPlan", LightboxConfirmCancelPlanDirective)
