class InstallPolemic < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :commentable, :polymorphic => true
      t.text :body
      t.references :user
      t.string :ancestry
      t.boolean :deleted, :default => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end