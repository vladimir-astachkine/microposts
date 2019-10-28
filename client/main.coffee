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
        Todos.insert {text : text, createdAt: new Date(), userId: Meteor.userId(), username: Meteor.user().username}
        event.target.text.value = ''

        console.log text
        return false
    
    "click .toggle-checked" : ->
        Todos.update @_id, {$set:{checked: !@checked}}

    "click .delete-todo" : ->
        if confirm 'Are you sure?'
            Todos.remove @_id  

Accounts.ui.config {passwordSignupFields:"USERNAME_ONLY"}