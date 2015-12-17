require "administrate/base_dashboard"

class LawyerProfileDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    attorney: Field::BelongsTo,
    id: Field::Number,
    name: Field::Text,
    address: Field::String,
    state: Field::Text,
    body: Field::Text,
    practices: Field::Text,
    license: Field::Text,
    phone: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    lawyer_id: Field::Number,
    image: Field::String,
    longitude: Field::Number.with_options(decimals: 2),
    latitude: Field::Number.with_options(decimals: 2),
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :attorney,
    :id,
    :name,
    :address,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :attorney,
    :name,
    :address,
    :state,
    :body,
    :practices,
    :license,
    :phone,
    :lawyer_id,
    :image,
    :longitude,
    :latitude,
  ]

  # Overwrite this method to customize how lawyer profiles are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(lawyer_profile)
  #   "LawyerProfile ##{lawyer_profile.id}"
  # end
end
