# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ProductCategory.destroy_all
Category.destroy_all
Product.destroy_all
Zone.destroy_all


a = Category.create(name: "Sandwich", description:"Descripcion de los Sandwich")
b = Category.create(name: "Completos", description:"Descripcion de los Completos")
c = Category.create(name: "As", description:"Descripcion de los As")

p1 = Product.create(name: "A lo probre")
p2 = Product.create(name: "Aleman")
p3 = Product.create(name: "Barro Jarpa")

a.products << p1
a.products << p2
a.products << p3


p1 = Product.create(name: "Brasileño")
p2 = Product.create(name: "Chemilicio")
p3 = Product.create(name: "Campestre")

b.products << p1
b.products << p2
b.products << p3

p1 = Product.create(name: "Completo")
p2 = Product.create(name: "Dinamico")
p3 = Product.create(name: "Chacarero")

c.products << p1
c.products << p2
c.products << p3

z1 = Zone.create(name: "Zona 1")
z2 = Zone.create(name: "Zona 2")
z3 = Zone.create(name: "Zona 3")