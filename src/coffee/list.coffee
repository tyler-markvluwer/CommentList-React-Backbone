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

	logTest: (object) ->
		log object


module.exports = kwlList