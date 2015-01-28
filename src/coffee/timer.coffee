# Create a custom component by calling React.createClass
React = require('react')

# HTML tags
p = React.createFactory('p')
b = React.createFactory('b')

TimerExample = React.createClass

    getInitialState: ->
        # This is called before our render function. The object that is 
        # returned is assigned to this.state, so we can use it later.
        elapsed: 0

    componentDidMount: ->
        # componentDidMount is called by react when the component 
        # has been rendered on the page. We can set the interval here:

        this.timer = setInterval(this.tick, 50)

    componentWillUnmount: ->
        # This method is called immediately before the component is removed
        # from the page and destroyed. We can clear the interval here:

        clearInterval(this.timer)

    tick: ->
        # This function is called every 50 ms. It updates the 
        # elapsed counter. Calling setState causes the component to be re-rendered

        this.setState({elapsed: new Date() - this.props.start})

    render: ->
        elapsed = Math.round(this.state.elapsed / 100)

        # This will give a number with one digit after the decimal dot (xx.x):
        seconds = (elapsed / 10).toFixed(1)

        # Although we return an entire <p> element, react will smartly update
        # only the changed parts, which contain the seconds variable.

        p
            className: 'someclass'
            'This example was started '
            b {},
                seconds + ' seconds'
            ' ago'

module.exports = React.createFactory(TimerExample)