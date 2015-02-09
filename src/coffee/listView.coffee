# render our kwlList
React = require('react')
ListItemView = require('./listItemView')

# HTML tags
ul = React.createFactory('ul')

ListView = React.createClass
	componentDidMount: ->
		@props.kList.on 'change', @update

	update: -> @forceUpdate()

	render: ->
		ul {},
			for item in @props.kList.items
				ListItemView
					item: item

module.exports = React.createFactory(ListView)