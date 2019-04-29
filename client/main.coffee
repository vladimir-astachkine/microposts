# adding comments 
import { Template } from 'meteor/templating'
import {Session} from 'meteor/session'

import './main.html'

Session.setDefault 'counter', 0

Template.hello.helpers
    counter: -> Session.get 'counter'

Template.hello.events
    'click button': -> Session.set 'counter', Session.get('counter') + 1