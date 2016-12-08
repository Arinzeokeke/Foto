class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :op_user, foreign_key: true
      t.references :post, foreign_key: true
      t.integer :comment_id
      t.string :type
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
