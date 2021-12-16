class AddCounterCache < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :reviews_count, :integer, default: 0
  end
end
