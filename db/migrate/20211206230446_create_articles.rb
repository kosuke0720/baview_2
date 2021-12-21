class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references  :baby,             null: false, foreign_key: true
      t.date        :content_date,     null: false
      t.text        :content,          null: false
      t.timestamps
    end
  end
end
