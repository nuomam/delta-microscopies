require 'json'

# Create Categories
c = ["REACTIFS", "MICROSCOPIE OPTIQUE", "PREPARATION ECHANTILLONS", "PETIT EQUIPEMENT",
  "PINCES-OUTILS PRECISION", "ULTRAMICROTOMIE", "VIDE ET EVAPORATION", "MET MICROSCOPIE ELECTRONIQUE A TRANSMISSION",
  "MEB MICROSCOPIE ELECTRONIQUE A BALAYAGE", "PHOTOGRAPHIE", "STANDARDS ET CALIBRATION"]

c.each do |category|
  Category.create(name: category.capitalize)
end

# Create Sub-categories
sc_reactifs = ['CHIMIE', 'IMMUNOGOLDS', 'MILIEU DE MONTAGE']
sc_reactifs.each do |sub_category|
  SubCategory.create(name: sub_category.capitalize, category_id: 1)
end

sc_microscopie_optique = ['LAMES - LAMELLES', 'INCLUSION', 'HUILES A IMMERSION', 'MATERIEL OPTIQUE']
sc_microscopie_optique.each do |sub_category|
  SubCategory.create(name: sub_category.capitalize, category_id: 2)
end

sc_preparation_echantillon = ['CLEANING', 'SPUTTER TARGET', 'TUBES - SUPPORTS', 'FILTRATION', 'CRYO', 'RASOIRS ET LAMES', 'MOULES', 'POLISSAGE', 'PETIT MATERIEL']
sc_preparation_echantillon.each do |sub_category|
  SubCategory.create(name: sub_category.capitalize, category_id: 3)
end

sc_preparation_equipement = ['LAMPES']
sc_preparation_equipement.each do |sub_category|
  SubCategory.create(name: sub_category.capitalize, category_id: 4)
end

sc_ultramicrotomie = ['COUTEAUX DIATOME']
sc_ultramicrotomie.each do |sub_category|
  SubCategory.create(name: sub_category.capitalize, category_id: 6)
end

sc_met = ['GRILLES', 'GRILLES AVEC SUPPORT', 'FILAMENTS ET CATHODES', 'STOCKAGE GRILLES']
sc_met.each do |sub_category|
  SubCategory.create(name: sub_category.capitalize, category_id: 8)
end

# Create Suppliers
s = [ "AURION", "CARGILLE", "CREATIVE REGIE", "DIATOME Ltd Switzerland", "DIGIT PHOTO", "EMS", "PROZIC", "ROTH Sochiel EURL", "CHROMALYS SAS", "VWR International" ]

s.each do |supplier|
  Supplier.create(name: supplier.capitalize)
end

# Import products
file = File.read('db/test_import.json')
data_hash = JSON.parse(file)
p_count = data_hash.count
data_hash.each do |p|
  product = Product.create!(
    name: p["name"],
    supplier: Supplier.find_by(name: p["﻿supplier"].capitalize),
    sub_category: SubCategory.find_by(name: p["sub_category"].capitalize),
    delta_ref: p["delta_ref"],
    supplier_ref: p["supplier_ref"],
    product_number: p["product_number"],
    sell_price: p["sell_price"],
    buy_price: p["buy_price"]
    )
  puts product
  p_count -= 1
  puts p_count
end
