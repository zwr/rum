User.delete_all

User.create! email: 'rocky@zwr.fi', password: 'balboa123'
User.create! email: 'z@zwr.fi', password: 'balboa123', admin: true
