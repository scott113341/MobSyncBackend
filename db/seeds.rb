User.create(username: 'scott113341', name: 'Scott Hardy', device_id: 'f16b668360bf8b87e7464bbf649ab0fe389f06198b135a616cffcfe19953627f')
User.create(username: 'mattzzz', name: 'Matt Medal', device_id: 'abc123')

Mob.create(user_id: User.first.id, user_idz: User.all.map{|u| u.id}.join(','), destination: 'Taco Bell')
