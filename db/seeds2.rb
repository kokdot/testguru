jhon = User.create(last_name: 'jhon', first_name: 'jhon', type: "Admin", email: 'jhon@gmail.com', password: 'pfqrf2008', confirmed_at: Time.now)
jhon.valid?
p jhon.errors
