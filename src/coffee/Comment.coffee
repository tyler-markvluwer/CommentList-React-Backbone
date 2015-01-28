# Create a custom component by calling React.createClass
React = require('react')

# HTML tags
p = React.createFactory('p')
b = React.createFactory('b')
h2 = React.createFactory('h2')
div = React.createFactory('div')
comment = React.createFactory('Comment')

Comment = React.createClass
    displayName: 'Comment'

    render: ->
        div
            className: 'comment'
            h2
            	className: 'commentAuthor'
            	this.props.author
            this.props.children
           

module.exports = React.createFactory(Comment)