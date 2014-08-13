class Person < ActiveRecord::Base

  validate :person_validation

  def person_validation
    if title.blank?
      if first_name.blank? || self.last_name.blank?
        errors[:base] << "You must enter a title/first name or title/last name"
      end
    else
      if last_name.blank?
        errors[:base] << "You must enter a title/first name or title/last name"
      end
    end
  end
end