class @ListPeople extends React.Component

  render: ->
    list_people = []
    @props.people.forEach (person, index) =>
      list_people.push(
        <TableRow key={index} person={person} editPerson={@props.editPerson} />
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
    { person, editPerson } = @props
    { id, name, email } = person
    <tr>
      <td>{id}</td>
      <td>{name}</td>
      <td>{email}</td>
      <td><a href='javascript:void(0)' onClick={editPerson.bind(@, id)}>Edit</a></td>
      <td><a href='javascript:void(0)'>Delete</a></td>
    </tr>
