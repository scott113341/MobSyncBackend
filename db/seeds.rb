User.create(username: 'scott123', name: 'Scott Hardy', device_id: 'f16b668360bf8b87e7464bbf649ab0fe389f06198b135a616cffcfe19953627f')
User.create(username: 'matt123', name: 'Matt Medal', device_id: 'ba6790613381215502118b78f61c4ac6913931814cfabb4aaea1e0490c0f17ba')
User.create(username: 'trash', name: 'Trash Trash', device_id: 'abc')

Mob.create(user_id: User.first.id, user_idz: User.all.map{|u| u.id}.join(','), destination: 'Taco Bell')
