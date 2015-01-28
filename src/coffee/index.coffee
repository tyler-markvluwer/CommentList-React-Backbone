React = require('react')
Timer = require('./timer')
CommentBox = require('./CommentBox')
CommentList = require('./CommentList')
CommentForm = require('./CommentForm')
data = require('./data')

React.render(
    Timer
    	start: 1
    	end: 4
    document.getElementById('timer_div')
)

React.render(
	CommentBox
		data: data
	document.getElementById('CommentBox_div')
)