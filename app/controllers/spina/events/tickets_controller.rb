module Spina::Events
  class TicketsController < ApplicationController

    before_action :find_conference

    def index
      @tickets = @conference.tickets.sorted
      render layout: "#{current_theme.name.parameterize.underscore}/application"
    end

    private

    def find_conference
      @conference = Spina::Events::Conference.friendly.find(params[:conference_id])
    end
  end
end
