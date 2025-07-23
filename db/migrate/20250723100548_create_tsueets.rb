class CreateTsueets < ActiveRecord::Migration[8.0]
  def change
    create_table :tsueets do |t|
      t.text :content

      t.timestamps
    end
  end
end
