for $superheroe in //superheroe
where contains(lower-case($superheroe/@poderes), "fuerza") and contains(lower-case($superheroe/@amigos), "iron man")
return $superheroe


