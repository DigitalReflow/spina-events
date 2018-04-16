module Spina::Events
  module Admin
    module Conference
      class SpeakersController < AdminController
        before_action :set_breadcrumb
        before_action :set_locale

        layout 'spina/admin/events'

        def index
          @speakers = current_conference.speakers.order(created_at: :desc)
        end

        def edit
          @conference = current_conference
          add_breadcrumb I18n.t('spina.events.speakers.new')
          render layout: 'spina/admin/admin'
        end

        def update
          I18n.locale = params[:locale] || I18n.default_locale
          respond_to do |format|
            if current_conference.update_attributes(conference_params)
              I18n.locale = I18n.default_locale
              format.html { redirect_to spina.events_admin_conference_speakers_path(conference_id: current_conference.id, params: {locale: @locale}), notice: t('spina.events.speakers.saved') }
              format.js
            else
              format.html do
                render :edit, layout: 'spina/admin/admin'
              end
            end
          end
        end

        private

        def current_conference
          @conference ||= Spina::Events::Conference.find(params[:conference_id])
        end

        def set_breadcrumb
          add_breadcrumb I18n.t('spina.events.speakers.title'), spina.events_admin_speakers_path
        end

        def set_locale
          @locale = params[:locale] || I18n.default_locale
        end

        def conference_params
          params.require(:conference).permit(speaker_ids: [])
        end

      end
    end
  end
end
