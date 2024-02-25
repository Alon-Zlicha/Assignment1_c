CC=gcc
CFLAGS =-Wall -fpic
OBJFILES= basicClassification.o advancedClassificationLoop.o advancedClassificationRecursion.o main.o
LIBRARYS=  libClassloops.a libClassrec.a libClassrec.so libClassloops.so
PROGRAMS: mains maindloop maindrec
loops: libClassloops.a
recursives: libClassrec.a
recursived: libClassrec.so
loopd: libClassloops.so

all: mains maindloop maindrec loops recursives

basicClassification.o: basicClassification.c numClass.h
	$(CC) -c $(CFLAGS) basicClassification.c 

advancedClassificationLoop.o: advancedClassificationLoop.c numClass.h
	$(CC) -c $(CFLAGS)  advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c numClass.h
	$(CC) -c $(CFLAGS) advancedClassificationRecursion.c

main.o: main.c numClass.h
	$(CC) -c $(CFLAGS) main.c 

mains: main.o libClassrec.a
	$(CC) $(CFLAGS) main.o -lClassrec -L. -o mains

maindloop: main.o libClassloops.so
	$(CC) $(CFLAGS) main.o ./libClassloops.so -o maindloop

maindrec: main.o libClassrec.so
	$(CC) $(CFLAGS) main.o ./libClassrec.so -o maindrec

libClassloops.a: basicClassification.o advancedClassificationLoop.o
	$ ar -rc libClassloops.a basicClassification.o advancedClassificationLoop.o  

libClassrec.a: basicClassification.o advancedClassificationRecursion.o
	$ ar -rc libClassrec.a basicClassification.o advancedClassificationRecursion.o

libClassrec.so: basicClassification.c advancedClassificationRecursion.c basicClassification.o advancedClassificationRecursion.o 
	$(CC) $(CFLAGS) -shared -o libClassrec.so basicClassification.o advancedClassificationRecursion.o 

libClassloops.so: basicClassification.c advancedClassificationLoop.c basicClassification.o advancedClassificationLoop.o 
	$(CC) $(CFLAGS) -shared -o libClassloops.so basicClassification.o advancedClassificationLoop.o 	

clean:
	rm -f $(LIBRARYS) $(OBJFILES) mains maindloop maindrec

.PHONY:clean all loops recursives recursived loopd


