class RemoveFieldsFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :company, :string
    remove_column :jobs, :company_id, :string
  end
end
