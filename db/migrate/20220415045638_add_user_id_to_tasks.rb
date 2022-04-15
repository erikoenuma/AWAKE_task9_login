class AddUserIdToTasks < ActiveRecord::Migration[6.0]
  def change
    execute 'DELETE FROM tasks;'
    add_reference :tasks, :user, forign_key: true
  end
end
