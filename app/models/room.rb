class Room < ApplicationRecord
  has_many :messages

  effective_resource do
    name          :string
    timestamps
  end

  scope :deep, -> { all }

  validates :name, presence: true

  def to_s
    name
  end

end
