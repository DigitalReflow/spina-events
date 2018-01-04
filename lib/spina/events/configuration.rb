module Spina
  module Events
    include ActiveSupport::Configurable

    config_accessor :title, :controller, :description, :spina_icon, :plugin_type

    self.title = 'Events'
    self.controller = 'events'
    self.description = 'Events'
    self.spina_icon = 'pencil-outline'

    self.plugin_type = 'website_resource'
  end
end
