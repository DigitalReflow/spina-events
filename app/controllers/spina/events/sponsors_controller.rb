module Spina::Events
  class SponsorsController < ApplicationController

    before_action :find_conference

    def index
      @sponsors = @conference.sponsors
      render layout: "#{current_theme.name.parameterize.underscore}/application"
    end

    private

    def find_conference
      @conference = Spina::Events::Conference.friendly.find(params[:conference_id])
    end
  end
end
