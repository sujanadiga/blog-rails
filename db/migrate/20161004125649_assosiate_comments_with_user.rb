class AssosiateCommentsWithUser < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.belongs_to :user, index: true, foreign_key: true
    end
  end
end
