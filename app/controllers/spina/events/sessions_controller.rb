module Spina::Events
  class SpeakersController < ApplicationController

    before_action :find_conference

    def index
      @speakers = @conference.sessions
      render layout: "#{current_theme.name.parameterize.underscore}/application"
    end

    def show
      @speaker = Spina::Events::Speaker.friendly.find(params[:id])
      render layout: "#{current_theme.name.parameterize.underscore}/application"
    end

    private

    def find_conference
      @conference = Spina::Events::Conference.friendly.find(params[:conference_id])
    end
  end
end
