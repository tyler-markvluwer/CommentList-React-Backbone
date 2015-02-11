class Collab_Helper #extends EventEmitter
	#client member: same as js class
	#sessionName member: name of session in
	#sessionID member: has session ID or NULL
	#sessionTags member: list of string tags

	constructor: (@client, @sessName, @kList, @wList, @lList) ->
		@createSession(@sessName)

	# Create Session - Saif
	createSession: (sessName) ->
		if not @sessionExists(sessName)
			try
				log "session creating new session"
				if not window.location.hash # check if session exists
					@client.createSession({
						name: sessName,
						tags: ['kwl'],
						startPaused: false
					})
					.then (session) ->  #syntax error can't use function?
						#once the session is created, display it's id in the url as #<session id>
						console.log(session);
						history.pushState(null, null, '#' + session.session_id);
					return;
			catch
				@joinSession(sessName)
		else
			@joinSession(sessName)

	joinSession: (sessName) ->
		if @sessionExists(sessName)
			@client.listSessions(['kwl'])
			.then (sessions) ->
				for sess in sessions
					if sessName is sess.session_name
						@client.joinSession({session: sess})
			.then (session) -> 
				try
					#display the session id in the url as #<session id>
					log session
					history.pushState(null, null, '#' + session.session_id);
				catch
					(error) ->
						log error
		return

	# Check if Session exists - Tyler 
	sessionExists: (sessName) ->
		@client.listSessions(['kwl'])
		.then (sessions) ->
			for sess in sessions
				if sessName is sess.session_name
					return true
		.then ->
			return false

	# Client "on" change - Together
	setListenEvents: ->
		@client.on('event', (event) ->
			eventData = event.data();

			# check for all necessary data
			if not eventData.title
				log "No event title"
				return
			if not eventData.listName
				log "No event listName"
				return

			# handle event type
			if eventData.action is "add"
				@addEventAction(eventData)
				return
			if eventData.action is "edit" and eventData.oldTitle
				@editEventAction(eventData)
				return
			if eventData.action is "delete"
				@deleteEventAction(eventData)
				return
		)

	# Add change - Tyler
	# Handle "add" events
	addEventAction: (eventData) ->
		title = eventData.title;

		# check if ID already exists in our collection
		switch eventData.listName
			when "k" then @kList.createAddItem(title)
			when "w" then @wList.createAddItem(title)
			when "l" then @lList.createAddItem(title)
			else log "Bad listname in addEventAction()"

	# Edit change - Saif
	# Handle "edit" events
	editEventAction: (eventData) ->
		newTitle = eventData.title
		oldTitle = eventData.oldTitle

		switch eventData.listName
			when "k" then @kList.editItem(oldTitle, newTitle)
			when "w" then @wList.editItem(oldTitle, newTitle)
			when "l" then @lList.editItem(oldTitle, newTitle)
			else log "Bad listname in editEventAction()"

	deleteEventAction: (eventData) ->
		title = eventData.title

		switch eventData.listName
			when "k" then @kList.deleteItemByTitle(title)
			when "w" then @wList.deleteItemByTitle(title)
			when "l" then @lList.deleteItemByTitle(title)
			else log "Bad listname in deleteEventAction()"

module.exports = Collab_Helper