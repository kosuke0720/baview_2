class CreateBabies < ActiveRecord::Migration[6.0]
  def change
    create_table :babies do |t|
      t.references  :user,           null: false, foreign_key: true
      t.string      :baby_name,      null: false
      t.date        :birth_date,     null: false
      t.timestamps
    end
  end
end
