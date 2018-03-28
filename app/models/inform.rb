class Inform < ApplicationRecord
  serialize :receivers, Array
  serialize :criteria, Hash
  serialize :test, Array
end

