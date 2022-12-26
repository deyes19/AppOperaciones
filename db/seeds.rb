# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
r1 = Role.create({ name: 'Regular', description: 'Solo leer las cosas' })
r2 = Role.create({ name: 'Admin', description: 'Puede manipular cualquier cosa' })

u2 = User.create({ name: 'Deimer', email: 'deimer.yepes@record.com.co', password: '123456', password_confirmation: '123456', role_id: r2.id })