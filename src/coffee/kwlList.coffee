Item = require('./item')
EventEmitter = require('events').EventEmitter

class KwlList extends EventEmitter
	constructor: (@name) ->
		@items = []

	size: ->
		@items.length

	createAddItem: (title) ->
		@addItem({title: title, ID: 2, listName: {@name}})

	addItem: (item) ->
		#check item is valid
		console.log "item has no title" if not item.title
		console.log "item has bad ID" if (item.ID < 0)

		if @itemExists(item.title)
			log "Item already in list"
			return

		else
			item.listName = @name # needed for redo undo
			@items.push item
			@emit 'change'

	deleteItemByTitle: (title) ->
		#console.log item for item in @items when item.title is title
		@items = @items.filter (item) -> item.title isnt title
		@emit 'change'

	itemExists: (title, listName) ->
		for item in @items
			if item.title is title and item.listName is listName
				return true

		return false

	# find item and overwrite old title with the new title
	editItem: (oldTitle, newTitle) ->
		if not @itemExists(newTitle)
			@updateTitleHelper(item, newTitle) for item in @items when item.title is oldTitle and newTitle

	updateTitleHelper: (item, newTitle) ->
		item.title = newTitle
		@emit 'change'

	broadcastChange: (item, changeType) ->
		# broadcast the change to Collabrify

	logTest: (item) ->
		console.log item

	jsonifyItems: ->
		JSON.stringify(@items)

module.exports = KwlList