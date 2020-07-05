module ApplicationHelper
  include Pagy::Frontend

  def display_resources_title(resource_name)
    "Your #{resource_name}"
  end
end
