import {Mongo} from 'meteor/mongo'

export Todos = new Mongo.Collection('todos')

# Meteor Server Methods
Meteor.methods
    addTodo: (text) -> 
        if ! Meteor.userId()
            throw new Meteor.Error('not authorized')
        else
            Todos.insert {text : text, createdAt: new Date(), userId: Meteor.userId(), username: Meteor.user().username}
 
    deleteTodo: (todoId) ->
        myTodo = Todos.findOne(todoId)
        if myTodo.userId != Meteor.userId() 
            throw new Meteor.Error 'not-authorized'
        Todos.remove(todoId)

    setChecked: (todoId, setChecked) ->
        myTodo = Todos.findOne(todoId)
        if myTodo.userId != Meteor.userId() 
            throw new Meteor.Error 'not-authorized'
        Todos.update todoId, {$set:{checked: ! setChecked}}