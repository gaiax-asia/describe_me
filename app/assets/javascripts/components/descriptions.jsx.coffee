jQuery ->
  Component.Descriptions = React.createClass
    getDefaultProps: ->
      {
        descriptions: ["HoHo","Lorem Ipsum","Nyohohoho"]
      }

    getInitialState: ->
      {
        descriptions: this.props.descriptions
      }
    renderDescription: ->
      this.state.descriptions.map (desc) =>
        return `<Component.Description description={desc}/>`
    render: ->
      return `<div className='container'>
          {this.renderDescription()}
        </div>`
