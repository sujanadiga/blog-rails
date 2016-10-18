class AssosiateCommentsWithUser < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.belongs_to :user, index: true
    end
  end
end
