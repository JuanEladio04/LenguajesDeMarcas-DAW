<marvel>{
for $sh in //superheroe
return 
    <superheroe>
        <nombre>{data($sh/@nombre)}</nombre>
        <poderes>{data($sh/@poderes)}</poderes>
        <amigos>{data($sh/@amigos)}</amigos>
        <nivel>{data($sh/@nivel)}</nivel>
    </superheroe>
}</marvel>

