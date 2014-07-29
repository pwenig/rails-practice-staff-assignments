class Person < ActiveRecord::Base

  validate :custom_validate

  def custom_validate
    if self.last_name.present? == false
    self.errors[:last_name] << 'This person could not be created. You must enter a title/last name/first name'
  end
end
end

