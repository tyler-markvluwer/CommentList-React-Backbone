# Create a custom component by calling React.createClass
React = require('react')
CommentList = require('./CommentList')
CommentForm = require('./CommentForm')

# HTML tags
p = React.createFactory('p')
b = React.createFactory('b')
div = React.createFactory('div')
h1 = React.createFactory('h1')

CommentBox = React.createClass
    displayName: 'CommentBox'

    render: ->
        div
            className: 'commentBox'
            h1
            	{}
            	'Comments'
            CommentList
            	data: this.props.data
            CommentForm()

module.exports = React.createFactory(CommentBox)