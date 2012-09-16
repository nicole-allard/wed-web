class User < ActiveRecord::Base
  has_one :guest_assoc
  has_one :guest_user, :through => :guest_assoc, :source => :guest
  has_one :inverse_guest_assoc, :class_name => "GuestAssoc", :foreign_key => :guest_id
  has_one :inverse_guest_user, :through => :inverse_guest_assoc, :source => :user
  
  has_one :menu
  has_one :user_code
  
  validate :email_validation, :on => :update
  
  # Requires a valid email for any user updates past the initial create
  def email_validation
    if email.blank? || !(email =~ /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/)
      errors.add(:email, "A valid email is required.")
    end
  end
  
  def guest
    guest_user || inverse_guest_user
  end
end