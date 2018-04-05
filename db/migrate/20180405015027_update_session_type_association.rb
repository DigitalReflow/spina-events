class UpdateSessionTypeAssociation < ActiveRecord::Migration[5.1]
  def up
    add_column :spina_events_sessions, :session_type_id, :integer
    add_index :spina_events_sessions, :session_type_id
    remove_column :spina_events_session_types, :session_id
  end

  def down
    add_column :spina_events_session_types, :session_id, :integer
    add_index :spina_events_session_types, :session_id
    remove_column :spina_events_sessions, :session_type_id
  end
end
