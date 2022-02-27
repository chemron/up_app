class ApplicationRecord < ActiveRecord::Base
  include UpApiHelper
  self.abstract_class = true
end
