class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :home_page_url
      t.string :home_entry_css
      t.string :title_css
      t.string :img_css
      t.string :intro_text_css

      t.timestamps
    end
  end
end
