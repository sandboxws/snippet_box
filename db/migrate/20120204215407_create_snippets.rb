class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.text :content
      t.string :lang
      t.string :hash_code
      t.boolean :private, :default => false

      t.timestamps
    end
  end
end
