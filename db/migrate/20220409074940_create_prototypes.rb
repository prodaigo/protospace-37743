class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title,    null: false
      t.text :catch_copy, null: false
      t.text :concept,    null: false
      t.references :user, null: false, foreign_key: true  #references型を用いることで外部キーのカラム追加

      t.timestamps
    end
  end
end
