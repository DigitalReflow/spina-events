module Spina::Events
  class ConferencesController < ApplicationController

    before_action :set_page
    before_action :find_conferences, only: [:index]

    def index
      respond_to do |format|
        format.atom
        format.html { render layout: "#{current_theme.name.parameterize.underscore}/application" }
      end
    end

    def show
      @conference = Spina::Events::Conference.friendly.find(params[:id])
      render layout: "#{current_theme.name.parameterize.underscore}/application"
    rescue ActiveRecord::RecordNotFound
      try_redirect
    end

    private

    def set_page
      @page = Spina::Page.find_or_create_by(name: 'events') do |page|
        page.title = 'Events'
        page.link_url = '/events'
        page.deletable = false
      end
    end

    def find_conferences
      @conferences = Spina::Events::Conference.live.order(title: :asc).page(params[:page])
    end

    def try_redirect
      rule = RewriteRule.find_by!(old_path: "/events/conference/#{params[:id]}")
      redirect_to rule.new_path, status: :moved_permanently
    end
  end
end
