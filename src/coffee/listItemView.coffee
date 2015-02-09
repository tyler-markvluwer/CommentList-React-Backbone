# render our kwlList
React = require('react')

# HTML tags
li = React.createFactory('li')

ListItemView = React.createClass

	render: ->
		li
			className: "list-item"
			@props.item.title

module.exports = React.createFactory(ListItemView)