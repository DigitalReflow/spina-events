module Spina::Events
  module Admin
    class VenuesController < AdminController
      before_action :set_breadcrumb
      before_action :set_locale

      layout 'spina/admin/events'

      def index
        @venues = Spina::Events::Venue.order(created_at: :desc)
      end

      def new
        @venue = Spina::Events::Venue.new
        add_breadcrumb I18n.t('spina.events.venues.new')
        render layout: 'spina/admin/admin'
      end

      def create
        @venue = Spina::Events::Venue.new(venue_params)
        if @venue.save
          redirect_to spina.edit_events_admin_venue_url(@venue.id), notice: t('spina.events.venues.saved')
        else
          add_breadcrumb I18n.t('spina.events.venues.new')
          render :new, layout: 'spina/admin/admin'
        end
      end

      def edit
        @venue = Spina::Events::Venue.find(params[:id])
        add_breadcrumb @venue.name
        render layout: 'spina/admin/admin'
      end

      def update
        I18n.locale = params[:locale] || I18n.default_locale
        @venue = Spina::Events::Venue.find(params[:id])
        respond_to do |format|
          if @venue.update_attributes(venue_params)
            add_breadcrumb @venue.name
            @venue.touch
            I18n.locale = I18n.default_locale
            format.html { redirect_to spina.edit_events_admin_venue_url(@venue.id, params: {locale: @locale}), notice: t('spina.events.venues.saved') }
            format.js
          else
            format.html do
              render :edit, layout: 'spina/admin/admin'
            end
          end
        end
      end

      def destroy
        @venue = Spina::Events::Venue.friendly.find(params[:id])
        @venue.destroy
        redirect_to spina.events_admin_venues_path
      end

      private

      def set_breadcrumb
        add_breadcrumb I18n.t('spina.events.venues.title'), spina.events_admin_venues_path
      end

      def set_locale
        @locale = params[:locale] || I18n.default_locale
      end

      def venue_params
        params.require(:venue).permit(:name,
                                      :description,
                                      :slug,
                                      :address_line_1,
                                      :address_line_2,
                                      :city,
                                      :postcode,
                                      :photo_id,
                                      :longitude,
                                      :latitude,
                                      :country,
                                      :venue_id)
      end

    end
  end
end
