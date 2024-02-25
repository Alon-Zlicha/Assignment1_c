CC=gcc
CFLAGS =-Wall -fpic
OBJFILES= basicClassification.o advancedClassificationLoop.o advancedClassificationRecursion.o main.o
LIBRARYS=  libclassloops.a libclassrec.a libclassrec.so libclassloops.so
PROGRAMS: mains maindloop maindrec
loops: libclassloops.a
recursives: libclassrec.a
recursived: libclassrec.so
loopd: libclassloops.so

all: mains maindloop maindrec loops recursives 

basicClassification.o: basicClassification.c numClass.h
	$(CC) -c $(CFLAGS) basicClassification.c 

advancedClassificationLoop.o: advancedClassificationLoop.c numClass.h
	$(CC) -c $(CFLAGS)  advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c numClass.h
	$(CC) -c $(CFLAGS) advancedClassificationRecursion.c

main.o: main.c numClass.h
	$(CC) -c $(CFLAGS) main.c 

mains: main.o libclassrec.a
	$(CC) $(CFLAGS) main.o -lclassrec -L. -o mains

maindloop: main.o libclassloops.so
	$(CC) $(CFLAGS) main.o ./libclassloops.so -o maindloop

maindrec: main.o libclassrec.so
	$(CC) $(CFLAGS) main.o ./libclassrec.so -o maindrec

libclassloops.a: basicClassification.o advancedClassificationLoop.o
	$ ar rcs libClassloops.a basicClassification.o advancedClassificationLoop.o ranlib libclassrec.a

libclassrec.a: basicClassification.o advancedClassificationRecursion.o
	$ ar rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o

libclassrec.so: basicClassification.c advancedClassificationRecursion.c basicClassification.o advancedClassificationRecursion.o 
	$(CC) $(CFLAGS) -shared -o libclassrec.so basicClassification.o advancedClassificationRecursion.o 

libclassloops.so: basicClassification.c advancedClassificationLoop.c basicClassification.o advancedClassificationLoop.o 
	$(CC) $(CFLAGS) -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o 	

clean:
	rm -f $(LIBRARYS) $(OBJFILES) mains maindloop maindrec

.PHONY:clean all loops recursives recursived loopd


