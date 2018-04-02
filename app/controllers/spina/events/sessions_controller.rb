module Spina::Events
  class SessionsController < ApplicationController

    before_action :find_conference

    def index
      @sessions = @conference.sessions
      render layout: "#{current_theme.name.parameterize.underscore}/application"
    end

    def show
      @session = Spina::Events::Session.find(params[:id])
      render layout: "#{current_theme.name.parameterize.underscore}/application"
    end

    private

    def find_conference
      @conference = Spina::Events::Conference.friendly.find(params[:conference_id])
    end
  end
end
