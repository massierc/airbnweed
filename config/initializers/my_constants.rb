DRUGS = ["Cocaine", "Weed", "MDMA", "Heroin", "Ketamine", "LSD", "Ecstasy", "Steroids", "Crack", "BBQ Sauce"]

CITIES = []
User.all.each do |user|
  CITIES << user.city
end
CITIES.uniq!
