class @People extends React.Component

  constructor: (props) ->
    super(props)
    @state = {
      people: @props.people
      person: {
        name: '',
        email: ''
      }
      isEdit: false
      notice: ''
    }


  # Handle success add person
  addPerson: (data) =>
    @setState
      people: @state.people.concat(data)
      person: {name: '', email: ''}
      notice: "Person ##{data.id} was successfully created"
    setTimeout (->
      $('#notice').fadeOut()
      return
    ), 5000

  deletePerson: (id) =>
    $.ajax
      url: Routes.person_path(id)
      method: 'DELETE'
      dataType: 'json'
      success: (data) =>
        people = @props.people.filter (person) -> person.id != id
        @setState
          people: people
          person:
            name: ''
            email: ''
          isEdit: false
          notice: "Person ##{id} was successfully deleted"
        $('#notice').show()
        setTimeout (->
          $('#notice').fadeOut()
          return
        ), 5000

  editPerson: (id) =>
    person = $.grep @state.people, (person) -> person.id == id
    @setState
      person: person[0]
      isEdit: true

  updatePerson: (data) =>
    people = @state.people
    for person, index in people
      if person.id == data.id
        people[index] = data

    @setState
      people: people
      person:
        name: ''
        email: ''
      isEdit: false
      notice: "Person ##{data.id} was successfully updated"

    $('#notice').show()
    setTimeout (->
      $('#notice').fadeOut()
      return
    ), 5000

  render: ->
    <div>
      <p id='notice'>{@state.notice}</p>
      <FormPerson people={@state.people} person={@state.person} addPerson={@addPerson} isEdit={@state.isEdit} updatePerson={@updatePerson}/>
      <ListPeople people={@state.people} editPerson={@editPerson} deletePerson={@deletePerson}/>
    </div>
