class kwlList
	constructor: (@name) ->
		@items = []

	addItem: (item) ->
		#check item is valid
		log "item has no text" if (item.text.length < 1)
		log "item has bad ID" if (item.ID < 0)

		@items.push item

	deleteItemByTitle: (title) ->
		log item for item in @items when item.title is title

	deleteItemByID: (ID) ->
		log item for item in @items when item.ID is ID

	editItem: (newTitle, oldTitle) ->
		# find item and overwrite old title with the new title

	broadcastChange: (item, changeType) ->
		# broadcast the change to Collabrify

	logTest: (object) ->
		log object

module.exports = kwlList