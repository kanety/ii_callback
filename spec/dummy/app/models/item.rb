class Item < ActiveRecord::Base
  after_initialize ItemCallback
  before_validation CoactiveItemCallback
end
