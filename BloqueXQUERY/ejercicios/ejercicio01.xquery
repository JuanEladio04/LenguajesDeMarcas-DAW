for $superheroe in //superheroe
where substring($superheroe/@nombre, string-length($superheroe/@nombre)) = "a"
return $superheroe
