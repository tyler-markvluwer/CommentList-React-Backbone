//-------------
// Collabrify
//-------------

var sessionName = 'sessionName6';
var client = new CollabrifyClient({
    application_id: '4891981239025664',
    user_id: 'collabrify.tester@gmail.com'
});
if (!window.location.hash) {
    client.createSession({
        name: 'sessionName6',
        tags: ['kwl'],
        startPaused: false
    })
    .then(function(session) {
        //once the session is created, display it's id in the url as #<session id>
        console.log(session);
        history.pushState(null, null, '#' + session.session_id);
    })
    .catch(function(error) {
        //session might already exist, so try to find it and join it
        console.log(error.toString());
        client.listSessions(['kwl'])
            .then(function(sessions) {
                for (var i = 0; i < sessions.length; ++i) {
                    if (sessionName == sessions[i].session_name) {
                        client.joinSession({session:sessions[i]})
                            .then(function(session) {
                                //display the session id in the url as #<session id>
                                console.log(session);
                                history.pushState(null, null, '#' + session.session_id);
                            })
                            .catch(function(error){
                                console.log(error);
                            });
                        return;
                    }
                }
            //can't find a session with that name, print error to console
            console.log(error);
        })
        .catch(function(error){
            //encountered error when trying to list sessions
            console.log(error);
        });
    });
} else {
    var session_id = window.location.hash.replace('#', '');
    client.joinSession({session:{session_id:session_id}})
        .then(function(session) {
            console.log(session);
            history.pushState(null, null, '#' + session.session_id);
        })
        .catch(function(error) {
            console.log(sessionID);
            console.log(error);
        });
}

