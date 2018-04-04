module Spina::Events
  module Admin
    class ConferencesController < AdminController
      before_action :set_breadcrumb
      before_action :set_tabs, only: [:new, :create, :edit, :update]
      before_action :set_locale

      layout 'spina/admin/events'

      def index
        @conferences = Spina::Events::Conference.order(created_at: :desc)
      end

      def new
        @conference = Spina::Events::Conference.new
        add_breadcrumb I18n.t('spina.events.conferences.new')
        render layout: 'spina/admin/admin'
      end

      def create
        @conference = Spina::Events::Conference.new(conference_params)
        build_sessions
        if @conference.save
          redirect_to spina.edit_events_admin_conference_url(@conference.id), notice: t('spina.events.conferences.saved')
        else
          add_breadcrumb I18n.t('spina.events.conferences.new')
          render :new, layout: 'spina/admin/admin'
        end
      end

      def edit
        @conference = Spina::Events::Conference.find params[:id]
        add_breadcrumb @conference.title
        render layout: 'spina/admin/admin'
      end

      def update
        I18n.locale = params[:locale] || I18n.default_locale
        @conference = Spina::Events::Conference.find(params[:id])
        assign_session_speakers
        respond_to do |format|
          if @conference.update_attributes(conference_params)
            add_breadcrumb @conference.title
            @conference.touch
            I18n.locale = I18n.default_locale
            format.html { redirect_to spina.edit_events_admin_conference_url(@conference.id, params: {locale: @locale}), notice: t('spina.events.conferences.saved') }
            format.js
          else
            format.html do
              render :edit, layout: 'spina/admin/admin'
            end
          end
        end
      end

      def destroy
        @conference = Spina::Events::Conference.find(params[:id])
        @conference.destroy
        redirect_to spina.events_admin_conferences_path
      end

      private

      def build_sessions
        # Clear sessions and build fresh
        @conference.sessions = []

        session_attributes = params[:conference].delete(:sessions_attributes) || {}
        session_attributes.each do |_key, session_attrs|
          session_speakers_attributes = session_attrs.delete(:session_speakers_attributes) || {}
          conference_session = @conference.sessions.build(session_attrs.permit(:title, :description, :duration_minutes, :position))
          session_speakers_attributes[:speaker_ids].each do |speaker_id|
            next if speaker_id.blank?
            conference_session.session_speakers.build(speaker_id: speaker_id)
          end
        end
      end

      def assign_session_speakers
        conference_sessions = params[:conference].delete(:sessions_attributes) || {}
        conference_sessions.each do |_key, session_params|

          spina_session = ::Spina::Events::Session.find_by(id: session_params[:id])
          if spina_session.nil?
            spina_session = @conference.sessions.create(session_params.permit(:title, :description, :duration_minutes, :position))
          end
          session_speakers_attributes = session_params.delete(:session_speakers_attributes) || {}
          spina_session.update_attributes(session_params.permit(:title, :description, :duration_minutes, :position))

          # We delete all the session speakers and re-assign
          spina_session.session_speakers.delete_all
          session_speakers_attributes[:speaker_ids].each do |speaker_id|
            spina_session.session_speakers.create(speaker_id: speaker_id)
          end
        end
      end

      def set_breadcrumb
        add_breadcrumb I18n.t('spina.events.conferences.title'), spina.events_admin_conferences_path
      end

      def set_tabs
        @tabs = %w{conference_content conference_speakers conference_sessions conference_sponsors conference_questions conference_tickets conference_configuration}
      end

      def set_locale
        @locale = params[:locale] || I18n.default_locale
      end

      def conference_params
        params.require(:conference).permit( :title,
                                            :sub_title,
                                            :slug,
                                            :description,
                                            :photo_id,
                                            :draft,
                                            :attachment_id,
                                            :start_date,
                                            :end_date,
                                            :location,
                                            :conference_contact,
                                            :sponsorship_info,
                                            :venue_id,
                                            attendee_ids: [],
                                            speaker_ids: [],
                                            sessions_attributes: [:title, :description, :duration_minutes, :position, :_destroy, :id],
                                            sponsors_attributes: [:sponsor_type, :_destroy, :id, :organisation_id],
                                            questions_attributes: [:title, :body, :_destroy, :id, :position],
                                            tickets_attributes: [:name, :description, :code, :price, :_destroy, :id, :position] )
      end

    end
  end
end
