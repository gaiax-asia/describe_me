
jQuery ->
  Component.List = React.createClass
    getInitialState: ->
      {
        users: this.props.users
      }

    renderUserCatalogs: ->
      this.state.users.map (user) ->
        return `< Component.Catalog name={user.name} description={user.description} image={user.image} fb_link={user.link} id={user.id} descriptions={user.descriptions}/>`

    render: ->
      return `<div>{this.renderUserCatalogs()}</div>`
