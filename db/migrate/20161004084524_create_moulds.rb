class CreateMoulds < ActiveRecord::Migration
  def change
    create_table :moulds do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
