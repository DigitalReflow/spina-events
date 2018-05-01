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
          add_breadcrumb 'Add speakers'
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

        def sort
          params[:list].each_with_index do |speaker, position|
            update_speaker_position(speaker, position)
          end
          head :ok
        end

        def update_speaker_position(speaker, position)
          Spina::Events::ConferenceSpeaker.update(speaker_id: speaker[:id], position: position.to_i + 1, conference_id: current_conference[:id])
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
