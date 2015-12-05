Doorkeeper::Application.delete_all
Doorkeeper::AccessGrant.delete_all
Doorkeeper::AccessToken.delete_all
Membership.delete_all
User.delete_all
Organization.delete_all

File.open(Rails.root.join 'db', 'seeds', 'users.csv').each_with_index do |line, count|
  u = line.split ','
  User.create! email: u[6], password: u[8]
  # name: "#{u[1]} #{u[2]}",
  # gender: u[0],
  # address_street: u[3],
  # address_city: u[4].capitalize,
  # address_post_number: u[5],
  # email: u[6],
  # username: u[7],
  # password: u[8],
  # date_of_birth: Date.strptime(u[9], '%m/%d/%Y'),
  # cc_type: u[10],
  # cc_number: u[11],
  # cc_cvc: u[12],
  # cc_exp: u[13],
  # telnum: u[14]

  break if count > 10
end

MyGuessOfIntranetIp = `ifconfig`.scan(/inet ([\.\d]+)/).flatten.find { |x| x != '127.0.0.1' }

Doorkeeper::Application.create! name: 'rpm',
                                uid: '32258b408332a9504bf3d048a5879ed3b9978474d408b2f3c9bab1cb8a03cda3',
                                secret: '96a730fb7a806fc1f6cb8e52b7d1f40b5314126978dad977bfcb5682c922760c',
                                redirect_uri: "http://#{MyGuessOfIntranetIp}:3001/auth/"

Doorkeeper::Application.create! name: 'goldmill',
                                uid: '98dab9fa1c5e18f38bbe68ba149b58cc5e7b1f3290aca30b9d582fc65cae39d2',
                                secret: '7875fbdd7fa8ddb90db2c914543277bdf41280386d246c9a2a7c08b214abcfd0',
                                redirect_uri: "http://#{MyGuessOfIntranetIp}:3002/auth/"

Doorkeeper::Application.create! name: 'rwm',
                                uid: '08bcd408664a336218897c7979e1a039cfdf9952a0de7e1c1234ca9fb155a21f',
                                secret: '4f13b313752b9a9e5bc169fa1129f78bcc0f73b3bcf15a0aca1d64567c05ff47',
                                redirect_uri: "http://#{MyGuessOfIntranetIp}:3003/auth/"

Doorkeeper::Application.create! name: 'prodman',
                                uid: '3001479fa00f39c647881710a32af87a621575e6241cb5cf3ce267f2a4604474',
                                secret: 'ca0dc82ff1196075257f7f4f1d29c85011021f36efa6de276eacfee2150f8c91',
                                redirect_uri: "http://#{MyGuessOfIntranetIp}:3004/auth/"
puts "Seeded #{Doorkeeper::Application.count} apps."

m = Organization.new name: 'Celesta'
m.users << User.all.sample(3)
m.memberships.first.membership_type = 'admin'
m.save!

m = Organization.new name: 'Wood Company Ltd'
m.users << User.all.sample(16)
m.memberships.first.membership_type = 'admin'
m.save!

m = Organization.new name: 'Tool Rent Oy'
m.users << User.all.sample(21)
m.memberships.first.membership_type = 'admin'
m.save!

m = Organization.new name: 'Food Shop'
m.users << User.all.sample(7)
m.memberships[0].membership_type = 'admin'
m.memberships[3].membership_type = 'admin'
m.memberships[4].membership_type = 'admin'
m.save!

m = Organization.new name: 'Mohican'
m.users << User.all.sample(5)

rocky = User.create! email: 'rocky@zwr.fi', password: 'balboa123'
z = User.create! email: 'z@zwr.fi', password: 'balboa123', admin: true

m.memberships.new user: rocky, membership_type: 'admin'
m.save!

Organization.create! name: 'Balboa', # this is the admin Application
                     memberships: [Membership.new(user: z, membership_type: 'admin')]

puts "Seeded #{User.count} users."
puts "Seeded #{Organization.count} organizations."
