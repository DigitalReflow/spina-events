module Spina
  module Events
    class Engine < ::Rails::Engine
      isolate_namespace Spina::Events

      config.before_initialize do
        ::Spina::Plugin.register do |plugin|
          plugin.name = "events"
          plugin.namespace = 'events'
        end
      end

      config.to_prepare do
        Rails.application.config.assets.precompile += %w(spina/events/admin/events.js spina/events/admin/events.css)
      end

      config.generators do |g|
        g.test_framework :rspec, fixture: false
        g.fixture_replacement :factory_bot, dir: 'spec/factories'
        g.assets false
        g.helper false
      end

    end
  end
end
