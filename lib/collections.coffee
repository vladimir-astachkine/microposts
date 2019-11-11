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
        Todos.remove(todoId)

    setChecked: (todoId, setChecked) ->
        Todos.update todoId, {$set:{checked: ! setChecked}}