class Todo < ApplicationRecord
  belongs_to :user

  after_create :create_event

  private def create_event
    CreateEventJob.perform_later("todo_created", {
        title: self.title,
        description: self.description,
        created_at: self.created_at,
        updated_at: self.updated_at,
      },
      self.id
    )
  end
end
