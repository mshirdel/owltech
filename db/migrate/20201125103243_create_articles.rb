class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :url
      t.string :title
      t.text :intro_text
      t.references :source, null: false, foreign_key: true
      t.boolean :publish, default: false
      t.date :publish_date
      t.boolean :active, default: false
      t.string :img_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :articles, :url, unique: true
  end
end
