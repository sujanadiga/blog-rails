class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.references :article, index: true

      t.timestamps null: false
    end
  end
end
