class AddUserToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :blogs, :user, null: false, foreign_key: true
  end
end
