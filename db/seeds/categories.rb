default_categories = Category.defaults.map{|c| I18n.translate("api.v1.categories.defaults.#{c[0]}")}

default_categories.each do |category|
  Category.find_or_create_by(name: category)
end
