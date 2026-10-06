all:
	ghc -O main.hs -o add_qc
	mv add_qc ../bin/


test:
	ghc -O main.hs -o add_qc

clean:
	rm -f add_qc ../bin/add_qc main.hi main.o
