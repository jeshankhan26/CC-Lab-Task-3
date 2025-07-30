input = input.txt
output = output.txt

main: dowhile.l dowhile.y
	bison -d dowhile.y 
	flex dowhile.l 
	gcc dowhile.tab.c lex.yy.c 
	./a.exe  <$(input)> $(output)
	

