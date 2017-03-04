c = ["REACTIFS", "MICROSCOPIE OPTIQUE", "PREPARATION ECHANTILLONS", "PETIT EQUIPEMENT",
  "PINCES-OUTILS PRECISION", "ULTRAMICROTOMIE", "VIDE ET EVAPORATION", "MET MICROSCOPIE ELECTRONIQUE A TRANSMISSION",
  "MEB MICROSCOPIE ELECTRONIQUE A BALAYAGE", "PHOTOGRAPHIE", "STANDARDS ET CALIBRATION"]

c.each do |category|
  Category.create(name: category)
end

sc_reactifs = ['CHIMIE', 'IMMUNOGOLDS', 'MILIEU DE MONTAGE']
sc_reactifs.each do |sub_category|
  SubCategory.create(name: sub_category, category_id: 1)
end

sc_microscopie_optique = ['LAMES - LAMELLES', 'INCLUSION', 'HUILES A IMMERSION', 'MATERIEL OPTIQUE']
sc_microscopie_optique.each do |sub_category|
  SubCategory.create(name: sub_category, category_id: 2)
end

sc_preparation_echantillon = ['CLEANING', 'SPUTTER TARGET', 'TUBES - SUPPORTS', 'FILTRATION', 'CRYO', 'RASOIRS ET LAMES', 'MOULES', 'POLISSAGE', 'PETIT MATERIEL']
sc_preparation_echantillon.each do |sub_category|
  SubCategory.create(name: sub_category, category_id: 3)
end

sc_preparation_equipement = ['LAMPES']
sc_preparation_equipement.each do |sub_category|
  SubCategory.create(name: sub_category, category_id: 4)
end

sc_ultramicrotomie = ['COUTEAUX DIATOME']
sc_ultramicrotomie.each do |sub_category|
  SubCategory.create(name: sub_category, category_id: 6)
end

sc_met = ['GRILLES', 'GRILLES AVEC SUPPORT', 'FILAMENTS ET CATHODES', 'STOCKAGE GRILLES']
sc_met.each do |sub_category|
  SubCategory.create(name: sub_category, category_id: 8)
end
