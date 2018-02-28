module Spina::Events
  module Admin
    class OrganisationsController < AdminController
      before_action :set_breadcrumb
      before_action :set_locale

      layout 'spina/admin/events'

      def index
        @organisations = Spina::Events::Organisation.order(created_at: :desc)
      end

      def new
        @organisation = Spina::Events::Organisation.new
        add_breadcrumb I18n.t('spina.events.organisations.new')
        render layout: 'spina/admin/admin'
      end

      def create
        @organisation = Spina::Events::Organisation.new(organisation_params)
        if @organisation.save
          redirect_to spina.edit_events_admin_organisation_url(@organisation.id), notice: t('spina.events.organisations.saved')
        else
          add_breadcrumb I18n.t('spina.events.organisations.new')
          render :new, layout: 'spina/admin/admin'
        end
      end

      def edit
        @organisation = Spina::Events::Organisation.find params[:id]
        add_breadcrumb @organisation.name
        render layout: 'spina/admin/admin'
      end

      def update
        I18n.locale = params[:locale] || I18n.default_locale
        @organisation = Spina::Events::Organisation.find(params[:id])
        respond_to do |format|
          if @organisation.update_attributes(organisation_params)
            add_breadcrumb @organisation.name
            @organisation.touch
            I18n.locale = I18n.default_locale
            format.html { redirect_to spina.edit_events_admin_organisation_url(@organisation.id, params: {locale: @locale}), notice: t('spina.events.organisations.saved') }
            format.js
          else
            format.html do
              render :edit, layout: 'spina/admin/admin'
            end
          end
        end
      end

      def destroy
        @organisation = Spina::Events::Organisation.find(params[:id])
        @organisation.destroy
        redirect_to spina.events_admin_organisations_path
      end

      private

      def set_breadcrumb
        add_breadcrumb I18n.t('spina.events.organisations.title'), spina.events_admin_organisations_path
      end

      def set_locale
        @locale = params[:locale] || I18n.default_locale
      end

      def organisation_params
        params.require(:organisation).permit(:name, :slug, :website, :twitter, :linkedin, :facebook, :photo_id)
      end

    end
  end
end
