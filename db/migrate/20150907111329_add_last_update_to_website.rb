class AddLastUpdateToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :last_update, :datetime
  end
end
