input = input.txt
output = output.txt

main: ifelse.l ifelse.y
	bison -d ifelse.y 
	flex ifelse.l 
	gcc ifelse.tab.c lex.yy.c 
	./a.exe  <$(input)> $(output)
	

