input = input.txt
output = output.txt

main: switch.l switch.y
	bison -d switch.y 
	flex switch.l 
	gcc switch.tab.c lex.yy.c 
	./a.exe  <$(input)> $(output)
	

