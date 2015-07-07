class Product < ActiveRecord::Base
  extend Enumerize
  validates 		:title, :description, presence: true
  validate 			:title_is_shorter_than_description
  validates     :category, presence: true

  scope	:published,				-> { where(published: true) }
  scope	:priced_more_than,		->(price) { where('price > ?', price) }
  scope	:description_includes, 	->(description) { where('description ILIKE ?', "%#{description}%") }

  before_save		:strip_html_from_description
  before_validation	:title_is_lower_case

  enumerize :difficulty_level, in: [:easy, :medium, :hard]
  enumerize :country, in: Country.all.map{ |name, code| code }

  belongs_to		:category
#  belongs_to    :Product

  def strip_html_from_description
  	self.description =
  			ActionView::Base.full_sanitizer.sanitize(self.description)	
  end

  def title_is_shorter_than_description
  	return if title.blank? or description.blank?
  	if description.length < title.length
  		errors.add(:description, "can't be shorter than title")
  	end

  end

  def title_is_lower_case
  	self.title = self.title.downcase
  end

end