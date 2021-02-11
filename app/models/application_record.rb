class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
    before_commit :authenticate_user!

end
