# Create a custom component by calling React.createClass
React = require('react')

# HTML tags
p = React.createFactory('p')
b = React.createFactory('b')
br = React.createFactory('br')
div = React.createFactory('div')
comment = React.createFactory('Comment')

CommentList = React.createClass
    displayName: 'CommentList'

    render: ->
        div
            className: 'commentList'
            for commentData in @props.data
                console.log(commentData)
                comment
            	   author: commentData.author
            	   commentData.text

module.exports = React.createFactory(CommentList)