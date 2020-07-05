class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Constants
  PER_PAGE = 20
end
