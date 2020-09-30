class ResetAllCompanyCacheCounters < ActiveRecord::Migration[6.0]
  def change
    Company.all.each do |company|
      Company.reset_counters(company.id, :contacts)
    end
  end
end
