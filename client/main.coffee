# adding comments 
import { Template } from 'meteor/templating'
import { Session } from 'meteor/session'
import { Todos } from '../lib/collections'

import './main.html'

window.Todos = Todos
Todos.find().fetch()

Template.main.helpers
    todos : -> Todos.find {}, {sort:{createdAt: -1}}
    console.log 'main.helpers.worked on client'

Template.main.events
    "submit .new-todo" : (event) ->
        text = event.target.text.value
        Meteor.call 'addTodo', text
        event.target.text.value = ''

        console.log 'insert command'
        return false
    
    "click .toggle-checked" : ->
        Meteor.call 'setChecked', @_id,  @checked

    "click .delete-todo" : ->
        if confirm 'Are you sure?'
             Meteor.call 'deleteTodo', @_id

Accounts.ui.config {passwordSignupFields:"USERNAME_ONLY"}

