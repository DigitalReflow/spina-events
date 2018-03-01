module Spina::Events
  class ConferencesController < ApplicationController

    before_action :set_page

    def index
      @conferences = Spina::Events::Conference.live.order(title: :asc)
      render layout: "#{current_theme.name.parameterize.underscore}/application"
    end

    def show
      @conference = Spina::Events::Conference.friendly.find(params[:id])
      render layout: "#{current_theme.name.parameterize.underscore}/application"
    rescue ActiveRecord::RecordNotFound
      try_redirect
    end

    private

    def set_page
      @page = Spina::Page.find_or_create_by(name: 'conferences') do |page|
        page.title = 'Conferences'
        page.link_url = '/conferences'
        page.deletable = false
      end
    end

    def try_redirect
      rule = RewriteRule.find_by!(old_path: "/conferences/#{params[:id]}")
      redirect_to rule.new_path, status: :moved_permanently
    end
  end
end
