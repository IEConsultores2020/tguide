# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: 'fernando_torres36@yahoo.com',
            password: 'password',
            password_confirmation: 'password')
User.create(email: 'nanducho@gmail.com',
            password: 'password',
            password_confirmation: 'password')
User.create(email: 'marlefrada@yahoo.com.mx',
            password: 'password',
            password_confirmation: 'password')

Company.create(id: 1,
                name: "Envia")

Company.create(id: 2,
                name: "Servientrega")

Branch.create(id: 1,
              name: "Envia Circasia",
              company_id: 1,
              user_id: 1)

Branch.create(id: 2,
              name: "Envia Salento",
              company_id: 1,
              user_id: 1)

Branch.create(id: 3,
              name: "Envia Filandia",
              company_id: 1,
              user_id: 1)

Branch.create(id: 4,
              name: "Servientrega Armenia",
              company_id: 2,
              user_id: 2)

Person.create(id: 1,
              email: "p1enviacircasia@envia.com",
              name: "Person uno EC",
              citizenship: "Colombia",
              nid: "1",
              mobile: "301",
              branch_id: 1)

Person.create(id: 2,
              email: "p2enviacircasia@envia.com",
              name: "Person dos EC",
              citizenship: "Colombia",
              nid: "2",
              mobile: "302",
              branch_id: 1)

Person.create(id: 3,
              email: "p3enviasalento@envia.com",
              name: "Person tres ES",
              citizenship: "Colombia",
              nid: "3",
              mobile: "303",
              branch_id: 2)

Person.create(id: 4,
              email: "p4enviasfilanda@envia.com",
              name: "Person cuatro ES",
              citizenship: "Colombia",
              nid: "4",
              mobile: "304",
              branch_id: 3)

Person.create(id: 5,
              email: "p5servarmenia@servientrega.com",
              name: "Person cinco SA",
              citizenship: "Colombia",
              nid: "5",
              mobile: "305",
              branch_id: 4)

Track.create(code: "1A123456",
             status: 0,
             branch_id: 1,
             assigned_id: 1,
             owner_id: 1)

Track.create(code: "1A123457",
             status: 0,
             branch_id: 1,
             assigned_id: 1,
             owner_id: 1)

Track.create(code: "2A123458",
             status: 0,
             branch_id: 1,
             assigned_id: 2,
             owner_id: 1)

Track.create(code: "3A123459",
              status: 0,
              branch_id: 2,
              assigned_id: 3,
              owner_id: 1)

Track.create(code: "4A123460",
                status: 0,
                branch_id: 3,
                assigned_id: 4,
                owner_id: 1)

Track.create(code: "5A123461",
                  status: 0,
                  branch_id: 4,
                  assigned_id: 5,
                  owner_id: 2)

