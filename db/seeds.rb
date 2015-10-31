User.delete_all
Doorkeeper::Application.delete_all
Doorkeeper::AccessGrant.delete_all
Doorkeeper::AccessToken.delete_all

User.create! email: 'rocky@zwr.fi', password: 'balboa123'
User.create! email: 'z@zwr.fi', password: 'balboa123', admin: true

Doorkeeper::Application.create! name: 'rpm',
                                uid: '32258b408332a9504bf3d048a5879ed3b9978474d408b2f3c9bab1cb8a03cda3',
                                secret: '96a730fb7a806fc1f6cb8e52b7d1f40b5314126978dad977bfcb5682c922760c',
                                redirect_uri: 'http://192.168.6.108:3001/auth/'
