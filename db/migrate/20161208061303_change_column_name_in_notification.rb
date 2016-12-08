class ChangeColumnNameInNotification < ActiveRecord::Migration[5.0]
  def change
  	rename_column :notifications, :type, :notification_type
  end
end
