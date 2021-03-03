class Message < ApplicationRecord
  belongs_to :room
  has_rich_text :body

  effective_resource do
    timestamps
  end

  scope :deep, -> { with_rich_text_body_and_embeds }

  validates :body, presence: true

  after_commit(on: :create) do
    broadcast_append_to("room-#{room.id}")
  end

end
