class Role < ActiveRecord::Base
  def translated_name
    I18n.t(name, :scope => 'role')
  end
end  
