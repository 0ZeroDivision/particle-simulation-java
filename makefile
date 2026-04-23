JFLAGS = -g
JC = javac
.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $*.java
.PHONY: clean run
	
sources = $(wildcard *.java)
CLASSES = $(sources:.java=.class)

default: classes

classes: $(CLASSES:.java=.class)

run: classes
	java Balls3D

clean:
	$(RM) *.class
