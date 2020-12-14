# QUICK FIX - https://github.com/igorkasyanchuk/active_storage_validations/blob/master/lib/active_storage_validations/attached_validator.rb

class AttachedValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _value)
    return if record.send(attribute).attached?

    record.errors.add(attribute, :blank)
  end
end
