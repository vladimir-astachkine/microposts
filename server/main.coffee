import { Meteor } from 'meteor/meteor'
import { Todos } from '../lib/collections'

#Meteor.startup => console.log 'This code runs on server'

Meteor.publish 'todos', -> Todos.find(userId: @userId)


