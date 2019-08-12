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
# File: cant-own-project-explanation.directive.coffee
###

@.tuesmonContribPlugins = @.tuesmonContribPlugins or []

decorator = ($delegate) ->
    directive = $delegate[0]

    controller = (translatePartialLoader) ->
        translatePartialLoader.addPart('tuesmon-contrib-subscriptions')

    directive.controller = ["$translatePartialLoader", controller]

    directive.templateUrl = "compile-modules/tuesmon-contrib-subscriptions/decorators/cant-own-project-explanation.html"

    return $delegate

window.addDecorator("tgCantOwnProjectExplanationDirective", ["$delegate", decorator])
