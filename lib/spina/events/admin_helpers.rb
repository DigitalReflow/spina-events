module Spina
  module Events
    module AdminHelpers

      def link_to_add_sponsor(f, association, &block)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
          render("sponsor_fields", f: builder)
        end
        link_to '#', class: "add_sponsor_fields button button-link", data: {id: id, fields: fields.gsub("\n", "")} do
          block.yield
        end
      end

      def link_to_add_question(f, association, &block)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
          render("question_fields", f: builder)
        end
        link_to '#', class: "add_question_fields button button-link", data: {id: id, fields: fields.gsub("\n", "")} do
          block.yield
        end
      end

      def link_to_add_ticket(f, association, &block)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
          render("ticket_fields", f: builder)
        end
        link_to '#', class: "add_ticket_fields button button-link", data: {id: id, fields: fields.gsub("\n", "")} do
          block.yield
        end
      end

    end
  end
end
