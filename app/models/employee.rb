class Employee < ApplicationRecord

  # Constants
  GENDER = %w(female male others).freeze

  # Enum
  enum gender: [:female, :male, :others]

  # Association
  belongs_to :user
  # Validations
  validates_presence_of :first_name, :last_name, :age, :gender
  validates_inclusion_of :gender, in: GENDER
  validates_numericality_of :age

  # Methods

  def name
    "#{first_name} #{last_name}"
  end
end
