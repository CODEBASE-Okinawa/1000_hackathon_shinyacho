class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :content
      t.boolean :closed, default: false

      t.timestamps
    end
  end
end
