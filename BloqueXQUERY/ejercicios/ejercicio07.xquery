<html>
    <head>
        <title>Superhéroes de Marvel</title>
    </head>
    <body>
        <h1>Superhéroes de Marvel</h1>
        <table>
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Poderes</th>
                    <th>Amigos</th>
                    <th>Nivel</th>
                </tr>
            </thead>
            <tbody>{
                for $sh in //superheroe
                return
                    <tr>
                        <td>{data($sh/@nombre)}</td>
                        <td>{data($sh/@poderes)}</td>
                        <td>{data($sh/@amigos)}</td>
                        <td>{data($sh/@nivel)}</td>
                    </tr>
            }</tbody>
        </table>
    </body>
</html>
