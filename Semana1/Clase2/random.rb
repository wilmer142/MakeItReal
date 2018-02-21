#crea un programa que diga un numero aleatoria, 1 al 10 y pedirle al usuario que lo adivine
random = rand(1..10)
print "Trata de adivinar un numero del 1 a 10: "
number = gets.chomp

puts number == random ? "Ganaste" : "Perdiste, el numero correcto era #{random}"
