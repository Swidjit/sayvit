class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :label
      t.references :user, :null => false
      t.references :post, :null => false

      t.timestamps
    end
  end
end
