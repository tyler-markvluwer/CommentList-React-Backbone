React = require('react')
Item = require('./item')
ListView = require('./listView')
KwlList = require('./kwlList')
Collab_Helper = require('./collabrify_helper')

# Required to make stuff work...not sure why
'''
o = XMLHttpRequest.prototype.open
XMLHttpRequest.prototype.open = (a) ->
    arguments[1] = arguments[1].replace('file:', 'http:')
    return o.apply(this, arguments)
'''

# declare structures
item1 = new Item("test1", 1)
item2 = new Item("test2", 2)
item1.print()
item2.print()

kList = new KwlList "kList"
wList = new KwlList "wList"
lList = new KwlList "lList"


# create Collab_Helper
sessionName = 'sessionName6';
client = new CollabrifyClient({
    application_id: '4891981239025664',
    user_id: 'collabrify.tester@gmail.com'
});
collab_Helper = new Collab_Helper(client, "session6", kList, wList, lList)

# test adding items
kList.addItem(item1)
kList.addItem(item2)
wList.addItem(item2)

# Render things to screen
React.render(
	ListView
		kList: kList
	document.getElementById('CommentBox-div')
)

window.i = item1
window.k = kList
window.w = wList