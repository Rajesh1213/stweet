class AddAttachmentToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :attachment, :string
  end
end
