React = require('react')
Item = require('./item')
ListView = require('./listView')

# test file
KwlList = require('./kwlList')

data = require('./data')

doAction: ->
	title = document.getElementById('title-input').value
	console.log(title)

# declare structures
item1 = new Item("test1", 1)
item2 = new Item("test2", 2)
item1.print()
item2.print()

kList = new KwlList "kList"
wList = new KwlList "wList"

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