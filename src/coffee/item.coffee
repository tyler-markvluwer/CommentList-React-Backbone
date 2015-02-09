class item
	constructor: (@title, @ID) ->
		@listName = null

	print: ->
		console.log "title: " + @title + " - ID: " + @ID

module.exports = item