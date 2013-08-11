class UserCode < ActiveRecord::Base
  belongs_to :user
  
  validate :validate_codes, :on => :create
  before_update :prevent_update
  
  def validate_codes
    # Confirm max 1 other user with this code. This will be the 2nd.
    codes = UserCode.find_all_by_code(code)
    if (codes.size > 1)
      errors.add(:code, "Already #{codes.size} users with this code. Can be max 2")
    end
    if (name.blank? && (codes.size < 1 || codes.first.name.blank?))
      errors.add(:code, "Cannot leave name blank unless there is a non-blank name already for this code")
    end
  end
  
  def prevent_update
    # Too difficult to verify that after this code is updated that there will be only
    # two users with this code, based on if this is a create, an update of code, or
    # an update of another attr.
    errors[:base] << "Cannot update user codes. Please delete and recreate instead."
  end
end