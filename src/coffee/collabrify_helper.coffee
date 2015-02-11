class Collab_Helper extends EventEmitter
	#client member: same as js class
	#sessionName member: name of session in
	#sessionID member: has session ID or NULL
	#sessionTags member: list of string tags

#are these lines needed?
###
var sessionName = 'sessionName6';
var client = new CollabrifyClient({
    application_id: '4891981239025664',
    user_id: 'collabrify.tester@gmail.com'
});
###


	# Create Session - Saif
	createSession: (sessName) ->
		if not sessionExists(sessName) 
			log "session creating new session"
			if not (window.location.hash) { #do I need this line?
        			name: 'sessionName6',
        			tags: ['kwl'],
       			 	startPaused: false
    				.then(function(session)) { #syntax error can't use function?
       					#once the session is created, display it's id in the url as #<session id>
        				console.log(session);
        				history.pushState(null, null, '#' + session.session_id);
   					 })
    				return;


	# Join Session - Saif
	joinSession: (sessName) ->
	if sessionExists(sessName)
		@client.joinSession({session:sessions[i]})
                            .then(function(session) {
                                #display the session id in the url as #<session id>
                                console.log(session);
                                history.pushState(null, null, '#' + session.session_id);
                            }
                              	.catch(function(error){
                                console.log(error);
                            }
                            return;

	# Check if Session exists - Tyler 
	sessionExists: (sessName) ->
		@client.listSessions(@sessionTags)
            .then(function(sessions) {
                for (i = 0; i < sessions.length; ++i) {
                    if (sessionName == sessions[i].session_name) {
                    	return true;
                    }
     	return false;

	# Client "on" change - Together
	# OVERRIDE THIS FOR YOUR USES
	setListenEvents: ->
		client.on
			'event'
			(event) ->
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
    }

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
