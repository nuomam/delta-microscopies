class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :sub_category
  validates :name, presence: true
  validates :supplier, presence: true
  validates :sub_category, presence: true
  has_attachment :photo
  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :sub_category
    ]
  )

  scope :sub_category, lambda { |sub_category|
    where(sub_category: [*sub_category])
  }

scope :search_query, lambda { |query|
  # Searches the students table on the 'first_name' and 'last_name' columns.
  # Matches using LIKE, automatically appends '%' to each term.
  # LIKE is case INsensitive with MySQL, however it is case
  # sensitive with PostGreSQL. To make it work in both worlds,
  # we downcase everything.
  return nil  if query.blank?

  # condition query, parse into individual keywords
  terms = query.downcase.split(/\s+/)

  # replace "*" with "%" for wildcard searches,
  # append '%', remove duplicate '%'s
  terms = terms.map { |e|
    (e.gsub('*', '%') + '%').gsub(/%+/, '%')
  }
  # configure number of OR conditions for provision
  # of interpolation arguments. Adjust this if you
  # change the number of OR conditions.
  num_or_conds = 2
  where(
    terms.map { |term|
      "(LOWER(products.name) LIKE ? OR LOWER(products.description) LIKE ?)"
    }.join(' AND '),
    *terms.map { |e| [e] * num_or_conds }.flatten
  )
}

scope :sorted_by, lambda { |sort_option|
  # extract the sort direction from the param value.
  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
  case sort_option.to_s
  when /^created_at_/
    # Simple sort on the created_at column.
    # Make sure to include the table name to avoid ambiguous column names.
    # Joining on other tables is quite common in Filterrific, and almost
    # every ActiveRecord table has a 'created_at' column.
    order("products.created_at #{ direction }")
  when /^name_/
    # Simple sort on the name colums
    order("LOWER(products.name) #{ direction }")
  when /^country_name_/
    # This sorts by a student's country name, so we need to include
    # the country. We can't use JOIN since not all students might have
    # a country.
    order("LOWER(sub_category.name) #{ direction }").includes(:sub_category)
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
}



  # This method provides select options for the `sorted_by` filter select input.
  # It is called in the controller as part of `initialize_filterrific`.
  def self.options_for_sorted_by
    [
      ['Name (a-z)', 'name_asc'],
      ['Registration date (newest first)', 'created_at_desc'],
      ['Registration date (oldest first)', 'created_at_asc'],
      ['Sous catégorie (a-z)', 'sub_category_id_asc']
    ]
  end
end
