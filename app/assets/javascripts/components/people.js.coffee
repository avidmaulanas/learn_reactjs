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
    }

  componenWillUpdate: (nextProps, nextState) ->
    console.log(nextProps)
    console.log(nextState)

  # Handle success add person
  addPerson: (data) =>
    @setState
      people: @state.people.concat(data)
      person: {name: '', email: ''}

  deleteProduct: (index) =>
    { people } = @props
    people.splice(index, 1);
    @setState(people: people)

  editPerson: (id) =>
    person = $.grep @props.people, (person) -> person.id == id
    @setState
      person: person[0]
      isEdit: true

  updatePerson: (data) =>
    people = @state.people
    $.each people, (key, value) ->
      if key == 'id' && value == data.id
        people[key] = data

    @setState
      people: people
      person:
        name: ''
        email: ''
      isEdit: false

  render: ->
    <div>
      <FormPerson people={@state.people} person={@state.person} addPerson={@addPerson} isEdit={@state.isEdit} updatePerson={@updatePerson}/>
      <ListPeople people={@state.people} editPerson={@editPerson} />
    </div>
