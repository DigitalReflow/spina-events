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

      def set_breadcrumb
        add_breadcrumb I18n.t('spina.events.conferences.title'), spina.events_admin_conferences_path
      end

      def set_tabs
        @tabs = %w{conference_content conference_speakers conference_sponsors conference_questions conference_tickets conference_configuration}
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
                                            sponsors_attributes: [:sponsor_type, :_destroy, :id, :organisation_id],
                                            questions_attributes: [:title, :body, :_destroy, :id, :position],
                                            tickets_attributes: [:name, :description, :code, :price, :_destroy, :id, :position] )
      end

    end
  end
end
