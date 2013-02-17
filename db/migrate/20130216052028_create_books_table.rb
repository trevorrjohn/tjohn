class CreateBooksTable < ActiveRecord::Migration
  def up
    create_table :books do |t|
      t.text :title
      t.text :url
      t.text :comment
    end
  end

  def down
    drop_table :books
  end
end
