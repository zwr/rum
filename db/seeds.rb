Doorkeeper::Application.delete_all
Doorkeeper::AccessGrant.delete_all
Doorkeeper::AccessToken.delete_all
Membership.delete_all
User.delete_all
Organization.delete_all

rocky = User.create! email: 'rocky@zwr.fi', password: 'balboa123'
z = User.create! email: 'z@zwr.fi', password: 'balboa123', admin: true

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
puts "Seeded #{User.count} users."

MyGuessOfIntranetIp = `ifconfig`.scan(/inet ([\.\d]+)/).flatten.find { |x| x != '127.0.0.1' }

Doorkeeper::Application.create! name: 'rpm',
                                uid: '32258b408332a9504bf3d048a5879ed3b9978474d408b2f3c9bab1cb8a03cda3',
                                secret: '96a730fb7a806fc1f6cb8e52b7d1f40b5314126978dad977bfcb5682c922760c',
                                redirect_uri: "http://#{MyGuessOfIntranetIp}:3001/auth/"

puts "Seeded #{Doorkeeper::Application.count} apps."

Organization.create! name: 'Balboa', # this is the admin Application
                     memberships: [Membership.new(user: z, membership_type: 'admin')]

m = Organization.new name: 'Mohican'
m.memberships.new user: rocky, membership_type: 'admin'
m.users << User.all.sample(5)
m.save!

m = Organization.new name: 'Celesta'
m.users << User.all.sample(3)
m.memberships.first.membership_type = 'admin'
m.save!

puts "Seeded #{Organization.count} organizations."
