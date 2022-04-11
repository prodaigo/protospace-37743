class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content,         null: false
      t.references :prototype, null: false, foreign_key: true  #references型を用いることで外部キーのカラム追加
      t.references :user,      null: false, foreign_key: true  #references型を用いることで外部キーのカラム追加

      t.timestamps
    end
  end
end
