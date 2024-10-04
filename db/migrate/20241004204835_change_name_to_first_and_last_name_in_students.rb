class ChangeNameToFirstAndLastNameInStudents < ActiveRecord::Migration[7.1]
  def change 
    remove_column :students, :name, :string
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
  end
end
