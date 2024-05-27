class AddAgeToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :age, :integer
  end
end
