class CreateBrassDirigibles < ActiveRecord::Migration[6.0]
  def change
    create_table :brass_dirigibles do |t|

      t.timestamps
    end
  end
end
