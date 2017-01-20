class @ListPeople extends React.Component

  render: ->
    list_people = []
    @props.people.forEach (person, index) =>
      list_people.push(
        <TableRow key={index} index={index} person={person} editPerson={@props.editPerson} deletePerson={@props.deletePerson}/>
      )
    <div>
      <h1>Listing People</h1>
      <table>
        <thead>
          <tr>
            <th>{'#'}</th>
            <th>Name</th>
            <th>Email</th>
            <th colSpan="3"></th>
          </tr>
        </thead>

        <tbody>
          { list_people }
        </tbody>
      </table>
    </div>

class @TableRow extends React.Component
  render: ->
    { index, person, editPerson, deletePerson } = @props
    { id, name, email } = person
    <tr>
      <td>{index+1}</td>
      <td>{name}</td>
      <td>{email}</td>
      <td><a href='javascript:void(0)' onClick={editPerson.bind(@, id)}>Edit</a></td>
      <td><a href='javascript:void(0)' onClick={deletePerson.bind(@, id)} data-confirm='Are you sure?'>Delete</a></td>
    </tr>
