input = input.txt
output = output.txt

main: while.l while.y
	bison -d while.y 
	flex while.l 
	gcc while.tab.c lex.yy.c 
	./a.exe  <$(input)> $(output)
	

