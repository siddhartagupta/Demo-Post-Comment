class CreateImageComments < ActiveRecord::Migration[5.2]
  def change
    create_table :image_comments do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
