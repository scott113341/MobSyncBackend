User.create(username: 'scott123', password: 'a', name: 'Scott Hardy', device_id: 'f16b668360bf8b87e7464bbf649ab0fe389f06198b135a616cffcfe19953627f')
User.create(username: 'matt123', password: 'a', name: 'Matt Medal', device_id: 'ba6790613381215502118b78f61c4ac6913931814cfabb4aaea1e0490c0f17ba')
User.create(username: 'user1', password: 'a', name: 'User Oneguru', device_id: 'abc')
User.create(username: 'user2', password: 'a', name: 'User Twomaster', device_id: 'abc')
User.create(username: 'user3', password: 'a', name: 'User Threedude', device_id: 'abc')
User.create(username: 'user4', password: 'a', name: 'User Fourman', device_id: 'abc')
User.create(username: 'user5', password: 'a', name: 'User Fivemonster', device_id: 'abc')

#Mob.create(user_id: User.first.id, user_idz: User.all.map{|u| u.id}.join(','), destination: 'Taco Bell')
