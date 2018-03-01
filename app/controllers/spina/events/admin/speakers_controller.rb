module Spina::Events
  module Admin
    class SpeakersController < AdminController
      before_action :set_breadcrumb
      before_action :set_locale

      layout 'spina/admin/events'

      def index
        @speakers = Spina::Events::Speaker.order(created_at: :desc)
      end

      def new
        @speaker = Spina::Events::Speaker.new
        add_breadcrumb I18n.t('spina.events.speakers.new')
        render layout: 'spina/admin/admin'
      end

      def create
        @speaker = Spina::Events::Speaker.new(speaker_params)
        if @speaker.save
          redirect_to spina.edit_events_admin_speaker_url(@speaker.id), notice: t('spina.events.speakers.saved')
        else
          add_breadcrumb I18n.t('spina.events.speakers.new')
          render :new, layout: 'spina/admin/admin'
        end
      end

      def edit
        @speaker = Spina::Events::Speaker.find(params[:id])
        add_breadcrumb @speaker.name
        render layout: 'spina/admin/admin'
      end

      def update
        I18n.locale = params[:locale] || I18n.default_locale
        @speaker = Spina::Events::Speaker.find(params[:id])
        respond_to do |format|
          if @speaker.update_attributes(speaker_params)
            add_breadcrumb @speaker.name
            @speaker.touch
            I18n.locale = I18n.default_locale
            format.html { redirect_to spina.edit_events_admin_speaker_url(@speaker.id, params: {locale: @locale}), notice: t('spina.events.speakers.saved') }
            format.js
          else
            format.html do
              render :edit, layout: 'spina/admin/admin'
            end
          end
        end
      end

      def destroy
        @speaker = Spina::Events::Speaker.find(params[:id])
        @speaker.destroy
        redirect_to spina.events_admin_speakers_path
      end

      private

      def set_breadcrumb
        add_breadcrumb I18n.t('spina.events.speakers.title'), spina.events_admin_speakers_path
      end

      def set_locale
        @locale = params[:locale] || I18n.default_locale
      end

      def speaker_params
        params.require(:speaker).permit(:name,
                                      :job_title,
                                      :slug,
                                      :bio,
                                      :position,
                                      :organisation_id,
                                      :photo_id)
      end

    end
  end
end
