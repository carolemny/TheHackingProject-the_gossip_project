class AddSenderToPrivateMessage < ActiveRecord::Migration[5.2]
  def change
    add_reference :private_messages, :sender, foreign_key: true
  end
end
