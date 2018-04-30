module Spina::Events
  module Admin
    class SessionsController < AdminController
      before_action :set_breadcrumb
      before_action :set_locale

      layout 'spina/admin/events'

      def index
        @sessions = current_conference.sessions.sort_by_position
      end

      def new
        @session = current_conference.sessions.build
        add_breadcrumb I18n.t('spina.events.sessions.new')
        render layout: 'spina/admin/admin'
      end

      def create
        @session = current_conference.sessions.build(session_params)
        if @session.save
          redirect_to(
            spina.events_admin_conference_sessions_path(
              conference_id: params[:conference_id]
            ),
            notice: t('spina.events.sessions.saved')
          )
        else
          add_breadcrumb I18n.t('spina.events.sessions.new')
          render :new, layout: 'spina/admin/admin'
        end
      end

      def edit
        @session = current_conference.sessions.find(params[:id])
        add_breadcrumb @session.title
        render layout: 'spina/admin/admin'
      end

      def update
        I18n.locale = params[:locale] || I18n.default_locale
        @session = current_conference.sessions.find(params[:id])
        respond_to do |format|
          if @session.update_attributes(session_params)
            add_breadcrumb @session.title
            I18n.locale = I18n.default_locale
            format.html {
              redirect_to spina.events_admin_conference_sessions_path(
                conference_id: params[:conference_id],
                params: {locale: @locale}
              ),
              notice: t('spina.events.sessions.saved')
            }
            format.js
          else
            format.html do
              render :edit, layout: 'spina/admin/admin'
            end
          end
        end
      end

      def sort
        params[:list].each_pair do |parent_pos, parent_node|
          update_session_position(parent_node, parent_pos)
        end
        head :ok
      end

      def destroy
        @session = current_conference.sessions.find(params[:id])
        @session.destroy
        redirect_to spina.events_admin_conference_sessions_path(conference_id: params[:conference_id])
      end

      def update_session_position(session, position)
        Spina::Events::Session.update(session[:id], position: position.to_i + 1)
      end

      private

      def current_conference
        @conference ||= Spina::Events::Conference.find(params[:conference_id])
      end

      def set_breadcrumb
        add_breadcrumb I18n.t('spina.events.sessions.title'), spina.events_admin_conference_sessions_path
      end

      def set_locale
        @locale = params[:locale] || I18n.default_locale
      end

      def session_params
        params.require(:session).permit(:title, :description, :duration_minutes, :position, :id, :session_type_id, speaker_ids:[])
      end

    end
  end
end
