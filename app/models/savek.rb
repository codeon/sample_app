class Savek < ActiveRecord::Base

	default_scope { order(updated_at: :desc) }
end
