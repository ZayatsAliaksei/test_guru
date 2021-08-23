class CreateUsersTests < ActiveRecord::Migration[6.1]
  def change
    create_table :users_tests do |t|
      t.belongs_to :user, index: true
      t.belongs_to :test, index: true
      t.timestamps
    end
  end
end
