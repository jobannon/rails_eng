class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.find_all(query_hash)
    where(query_hash)
  end

  # def self.find_rand(Model)
  #   # total_merchants = Merchant.all.count - 1
  #   array_for_sampling = Array.new
  #   Model.all.each do |model|
  #     array_for_sampling << model.id
  #   end
  #   Model.find(array_for_sampling.sample)
  # end
end
