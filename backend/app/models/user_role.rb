# frozen_string_literal: true

# UserRole
class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role

  validates_associated :user
  validates_associated :role
  validates_uniqueness_of :user, scope: :role
end
