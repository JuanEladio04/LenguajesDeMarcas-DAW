for $superheroe in //superheroe
where contains($superheroe/@poderes, "fuerza") and contains($superheroe/@amigos, "Iron Man")
return $superheroe

