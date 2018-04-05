module Spina::Events
  module Admin
    class SessionTypesController < AdminController
      before_action :set_breadcrumb
      before_action :set_locale

      layout 'spina/admin/events'

      def index
        @session_types = Spina::Events::SessionType.order(created_at: :desc)
      end

      def new
        @session_type = Spina::Events::SessionType.new
        add_breadcrumb I18n.t('spina.events.session_types.new')
        render layout: 'spina/admin/admin'
      end

      def create
        @session_type = Spina::Events::SessionType.new(session_type_params)
        if @session_type.save
          redirect_to spina.events_admin_session_types_path, notice: t('spina.events.session_types.saved')
        else
          add_breadcrumb I18n.t('spina.events.session_types.new')
          render :new, layout: 'spina/admin/admin'
        end
      end

      def edit
        @session_type = Spina::Events::SessionType.find(params[:id])
        add_breadcrumb @session_type.name
        render layout: 'spina/admin/admin'
      end

      def update
        I18n.locale = params[:locale] || I18n.default_locale
        @session_type = Spina::Events::SessionType.find(params[:id])
        respond_to do |format|
          if @session_type.update_attributes(session_type_params)
            add_breadcrumb @session_type.name
            I18n.locale = I18n.default_locale
            format.html {
              redirect_to spina.events_admin_session_types_path(params: { locale: @locale }),
              notice: t('spina.events.session_types.saved')
            }
            format.js
          else
            format.html do
              render :edit, layout: 'spina/admin/admin'
            end
          end
        end
      end

      def destroy
        @session_type = Spina::Events::SessionType.find(params[:id])
        @session_type.destroy
        redirect_to spina.events_admin_session_types_path
      end

      private

      def set_breadcrumb
        add_breadcrumb I18n.t('spina.events.session_types.title'), spina.events_admin_session_types_path
      end

      def set_locale
        @locale = params[:locale] || I18n.default_locale
      end

      def session_type_params
        params.require(:session_type).permit(:name)
      end
    end
  end
end
