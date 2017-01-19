class @FormPerson extends React.Component
  @propTypes =
    name: React.PropTypes.string
    email: React.PropTypes.string

  constructor: (props) ->
    super(props)
    @state = {
      people: []
      name: ''
      email:''
    }

  handleSubmit: (person) ->
    console.log(@state)
    # formData = $('.form-person').serialize()
    # $.ajax
    #   url: Routes.people_path()
    #   method: 'POST'
    #   dataType: 'json'
    #   data: formData
    #   success: (data) ->
    #     console.log(data)
    #     console.log(emptyForm)

  render: ->
    <div>
      <h3>New Person</h3>
      <form className='form-person'>
        <div className='field'>
          <input name='person[name]' type='text' value={@state.name}/>
        </div>
        <div className='field'>
          <input name= 'person[email]' type='text' value={@state.email}/>
        </div>
        <div className='actions'>
          <button type='button' onClick={@handleSubmit}>Submit</button>
        </div>
      </form>
    </div>
