class AddPicToProfile < ActiveRecord::Migration[5.2]
  def up
    add_attachment :profiles, :profile_pic
  end

  def down
    remove_attachment :profiles, :profile_pic
  end
end
