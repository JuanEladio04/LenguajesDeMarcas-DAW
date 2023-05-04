for $superheroe in //superheroe
where contains($superheroe/@poderes, "fuerza")
return $superheroe
