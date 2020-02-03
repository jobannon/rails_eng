class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.find_all(query_hash)
    where(query_hash)
  end

  def self.find_rand
    self.order('RANDOM()').first
  end
end
