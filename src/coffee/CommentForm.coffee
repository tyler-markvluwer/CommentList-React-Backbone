# Create a custom component by calling React.createClass
React = require('react')

# HTML tags
p = React.createFactory('p')
b = React.createFactory('b')
div = React.createFactory('div')

CommentForm = React.createClass
    displayName: 'CommentForm'

    render: ->
        div
            className: 'commentForm'
            'I am a CommentForm.'

module.exports = React.createFactory(CommentForm)