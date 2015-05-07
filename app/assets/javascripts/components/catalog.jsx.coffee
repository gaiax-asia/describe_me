#Main View

jQuery ->
  Component.Catalog = React.createClass
    render: ->
      return `<div className='container'>
        <div clasName='row'>
          Catalog
        </div>
        <div className='row'>
          <div className='col-sm-6 container'>
              <div className='row'>
                  <div className='col-sm-12 image'>
                      < Component.Image />
                  </div>
              </div>

              <div className='row'>
                  <div className='col-sm-12 details'>
                      < Component.Details />
                  </div>
              </div>
          </div>
          <div className='col-sm-6 container'>
            < Component.Descriptions />
          </div>

        </div>
        <div className='row'>
          <div className='col-sm-12'>
            < Component.DescriptionInput />
          </div>
        </div>
      </div>`