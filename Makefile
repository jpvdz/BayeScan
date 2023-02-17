# BayeScan makefile

bayescan_2.1: start.o beta.o dirichlet.o RJupdates.o MHupdates.o likelihood.o read_write.o anyoption.o 
	g++ -fopenmp -lpthread -lgomp -o bayescan_2.1 start.o beta.o dirichlet.o RJupdates.o MHupdates.o likelihood.o read_write.o anyoption.o -std=c++11

start.o: start.cpp errors.cpp anyoption.h global_defs.h
	g++ -fopenmp -c start.cpp errors.cpp -std=c++11

beta.o: beta.cpp global_defs.h
	g++ -fopenmp -c beta.cpp -std=c++11
      
dirichlet.o: dirichlet.cpp global_defs.h
	g++ -fopenmp -c dirichlet.cpp -std=c++11

RJupdates.o: RJupdates.cpp global_defs.h
	g++ -fopenmp -c RJupdates.cpp -std=c++11

MHupdates.o: MHupdates.cpp global_defs.h
	g++ -fopenmp -c MHupdates.cpp -std=c++11

likelihood.o: likelihood.cpp global_defs.h
	g++ -fopenmp -c likelihood.cpp -std=c++11

read_write.o: read_write.cpp errors.cpp global_defs.h
	g++ -fopenmp -c read_write.cpp errors.cpp -std=c++11

anyoption.o: anyoption.cpp anyoption.h 
	g++ -fopenmp -c anyoption.cpp -std=c++11

clean: 
	rm *.o bayescan_2.1
