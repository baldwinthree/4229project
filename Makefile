#############################################################################
# Makefile for building: terrain_gen
# Generated by qmake (2.01a) (Qt 4.7.4) on: Mon Dec 5 16:19:04 2011
# Project:  terrain_gen.pro
# Template: app
# Command: /usr/bin/qmake -o Makefile terrain_gen.pro
#############################################################################

####### Compiler, tools and options

CC            = gcc
CXX           = g++
DEFINES       = -DQT_WEBKIT -DQT_OPENGL_LIB -DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED
CFLAGS        = -m64 -pipe -g -D_REENTRANT -Wall -W $(DEFINES)
CXXFLAGS      = -m64 -pipe -g -D_REENTRANT -Wall -W $(DEFINES)
INCPATH       = -I/usr/share/qt4/mkspecs/linux-g++-64 -I. -I/usr/include/qt4/QtCore -I/usr/include/qt4/QtGui -I/usr/include/qt4/QtOpenGL -I/usr/include/qt4 -I. -I/usr/X11R6/include -Iobj
LINK          = g++
LFLAGS        = -m64
LIBS          = $(SUBLIBS)  -L/usr/lib/x86_64-linux-gnu -L/usr/X11R6/lib64 -lGLEW -lQtOpenGL -lQtGui -lQtCore -lGLU -lGL -lpthread 
AR            = ar cqs
RANLIB        = 
QMAKE         = /usr/bin/qmake
TAR           = tar -cf
COMPRESS      = gzip -9f
COPY          = cp -f
SED           = sed
COPY_FILE     = $(COPY)
COPY_DIR      = $(COPY) -r
STRIP         = strip
INSTALL_FILE  = install -m 644 -p
INSTALL_DIR   = $(COPY_DIR)
INSTALL_PROGRAM = install -m 755 -p
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p

####### Output directory

OBJECTS_DIR   = obj/

####### Files

SOURCES       = src/BloomShader.cpp \
		src/Camera3d.cpp \
		src/Chunk.cpp \
		src/CSCIx229.cpp \
		src/Generator.cpp \
		src/GLWidget.cpp \
		src/Heightmap.cpp \
		src/main.cpp \
		src/MainWindow.cpp \
		src/Map.cpp \
		src/Object.cpp \
		src/Particle.cpp \
		src/ParticleEngine.cpp \
		src/Perlin.cpp \
		src/Polygon.cpp \
		src/Skybox.cpp \
		src/TerrainTexture.cpp \
		src/ToonShader.cpp \
		src/TriangleMesh.cpp \
		src/Vec3.cpp \
		src/WaterShader.cpp obj/moc_GLWidget.cpp \
		obj/moc_MainWindow.cpp
OBJECTS       = obj/BloomShader.o \
		obj/Camera3d.o \
		obj/Chunk.o \
		obj/CSCIx229.o \
		obj/Generator.o \
		obj/GLWidget.o \
		obj/Heightmap.o \
		obj/main.o \
		obj/MainWindow.o \
		obj/Map.o \
		obj/Object.o \
		obj/Particle.o \
		obj/ParticleEngine.o \
		obj/Perlin.o \
		obj/Polygon.o \
		obj/Skybox.o \
		obj/TerrainTexture.o \
		obj/ToonShader.o \
		obj/TriangleMesh.o \
		obj/Vec3.o \
		obj/WaterShader.o \
		obj/moc_GLWidget.o \
		obj/moc_MainWindow.o
DIST          = /usr/share/qt4/mkspecs/common/g++.conf \
		/usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/debug.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/qt.prf \
		/usr/share/qt4/mkspecs/features/unix/opengl.prf \
		/usr/share/qt4/mkspecs/features/unix/thread.prf \
		/usr/share/qt4/mkspecs/features/moc.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		/usr/share/qt4/mkspecs/features/include_source_dir.prf \
		terrain_gen.pro
QMAKE_TARGET  = terrain_gen
DESTDIR       = 
TARGET        = terrain_gen

first: all
####### Implicit rules

.SUFFIXES: .o .c .cpp .cc .cxx .C

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.C.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.c.o:
	$(CC) -c $(CFLAGS) $(INCPATH) -o "$@" "$<"

####### Build rules

all: Makefile $(TARGET)

$(TARGET):  $(OBJECTS)  
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)

Makefile: terrain_gen.pro  /usr/share/qt4/mkspecs/linux-g++-64/qmake.conf /usr/share/qt4/mkspecs/common/g++.conf \
		/usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/debug.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/qt.prf \
		/usr/share/qt4/mkspecs/features/unix/opengl.prf \
		/usr/share/qt4/mkspecs/features/unix/thread.prf \
		/usr/share/qt4/mkspecs/features/moc.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		/usr/share/qt4/mkspecs/features/include_source_dir.prf \
		/usr/lib/x86_64-linux-gnu/libQtOpenGL.prl \
		/usr/lib/x86_64-linux-gnu/libQtGui.prl \
		/usr/lib/x86_64-linux-gnu/libQtCore.prl
	$(QMAKE) -o Makefile terrain_gen.pro
/usr/share/qt4/mkspecs/common/g++.conf:
/usr/share/qt4/mkspecs/common/unix.conf:
/usr/share/qt4/mkspecs/common/linux.conf:
/usr/share/qt4/mkspecs/qconfig.pri:
/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri:
/usr/share/qt4/mkspecs/features/qt_functions.prf:
/usr/share/qt4/mkspecs/features/qt_config.prf:
/usr/share/qt4/mkspecs/features/exclusive_builds.prf:
/usr/share/qt4/mkspecs/features/default_pre.prf:
/usr/share/qt4/mkspecs/features/debug.prf:
/usr/share/qt4/mkspecs/features/default_post.prf:
/usr/share/qt4/mkspecs/features/qt.prf:
/usr/share/qt4/mkspecs/features/unix/opengl.prf:
/usr/share/qt4/mkspecs/features/unix/thread.prf:
/usr/share/qt4/mkspecs/features/moc.prf:
/usr/share/qt4/mkspecs/features/warn_on.prf:
/usr/share/qt4/mkspecs/features/resources.prf:
/usr/share/qt4/mkspecs/features/uic.prf:
/usr/share/qt4/mkspecs/features/yacc.prf:
/usr/share/qt4/mkspecs/features/lex.prf:
/usr/share/qt4/mkspecs/features/include_source_dir.prf:
/usr/lib/x86_64-linux-gnu/libQtOpenGL.prl:
/usr/lib/x86_64-linux-gnu/libQtGui.prl:
/usr/lib/x86_64-linux-gnu/libQtCore.prl:
qmake:  FORCE
	@$(QMAKE) -o Makefile terrain_gen.pro

dist: 
	@$(CHK_DIR_EXISTS) obj/terrain_gen1.0.0 || $(MKDIR) obj/terrain_gen1.0.0 
	$(COPY_FILE) --parents $(SOURCES) $(DIST) obj/terrain_gen1.0.0/ && $(COPY_FILE) --parents src/BloomShader.h src/Camera3d.h src/Chunk.h src/CSCIx229.h src/Generator.h src/Global.h src/GLWidget.h src/Heightmap.h src/MainWindow.h src/Map.h src/Object.h src/Particle.h src/ParticleEngine.h src/Perlin.h src/Polygon.h src/Skybox.h src/TerrainTexture.h src/ToonShader.h src/TriangleMesh.h src/Vec3.h src/WaterShader.h obj/terrain_gen1.0.0/ && $(COPY_FILE) --parents src/BloomShader.cpp src/Camera3d.cpp src/Chunk.cpp src/CSCIx229.cpp src/Generator.cpp src/GLWidget.cpp src/Heightmap.cpp src/main.cpp src/MainWindow.cpp src/Map.cpp src/Object.cpp src/Particle.cpp src/ParticleEngine.cpp src/Perlin.cpp src/Polygon.cpp src/Skybox.cpp src/TerrainTexture.cpp src/ToonShader.cpp src/TriangleMesh.cpp src/Vec3.cpp src/WaterShader.cpp obj/terrain_gen1.0.0/ && (cd `dirname obj/terrain_gen1.0.0` && $(TAR) terrain_gen1.0.0.tar terrain_gen1.0.0 && $(COMPRESS) terrain_gen1.0.0.tar) && $(MOVE) `dirname obj/terrain_gen1.0.0`/terrain_gen1.0.0.tar.gz . && $(DEL_FILE) -r obj/terrain_gen1.0.0


clean:compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


####### Sub-libraries

distclean: clean
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) Makefile


check: first

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

compiler_moc_header_make_all: obj/moc_GLWidget.cpp obj/moc_MainWindow.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) obj/moc_GLWidget.cpp obj/moc_MainWindow.cpp
obj/moc_GLWidget.cpp: src/Polygon.h \
		src/Vec3.h \
		src/Camera3d.h \
		src/Map.h \
		src/Chunk.h \
		src/TriangleMesh.h \
		src/Global.h \
		src/TerrainTexture.h \
		src/Generator.h \
		src/Heightmap.h \
		src/Perlin.h \
		src/Skybox.h \
		src/CSCIx229.h \
		src/ParticleEngine.h \
		src/Particle.h \
		src/Object.h \
		src/BloomShader.h \
		src/ToonShader.h \
		src/WaterShader.h \
		src/GLWidget.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) src/GLWidget.h -o obj/moc_GLWidget.cpp

obj/moc_MainWindow.cpp: src/GLWidget.h \
		src/Polygon.h \
		src/Vec3.h \
		src/Camera3d.h \
		src/Map.h \
		src/Chunk.h \
		src/TriangleMesh.h \
		src/Global.h \
		src/TerrainTexture.h \
		src/Generator.h \
		src/Heightmap.h \
		src/Perlin.h \
		src/Skybox.h \
		src/CSCIx229.h \
		src/ParticleEngine.h \
		src/Particle.h \
		src/Object.h \
		src/BloomShader.h \
		src/ToonShader.h \
		src/WaterShader.h \
		src/MainWindow.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) src/MainWindow.h -o obj/moc_MainWindow.cpp

compiler_rcc_make_all:
compiler_rcc_clean:
compiler_image_collection_make_all: qmake_image_collection.cpp
compiler_image_collection_clean:
	-$(DEL_FILE) qmake_image_collection.cpp
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all:
compiler_uic_clean:
compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean 

####### Compile

obj/BloomShader.o: src/BloomShader.cpp src/BloomShader.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/BloomShader.o src/BloomShader.cpp

obj/Camera3d.o: src/Camera3d.cpp src/Camera3d.h \
		src/Map.h \
		src/Chunk.h \
		src/TriangleMesh.h \
		src/Vec3.h \
		src/Global.h \
		src/TerrainTexture.h \
		src/Generator.h \
		src/Polygon.h \
		src/Heightmap.h \
		src/Perlin.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/Camera3d.o src/Camera3d.cpp

obj/Chunk.o: src/Chunk.cpp src/Chunk.h \
		src/TriangleMesh.h \
		src/Vec3.h \
		src/Global.h \
		src/TerrainTexture.h \
		src/Generator.h \
		src/Polygon.h \
		src/Heightmap.h \
		src/Perlin.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/Chunk.o src/Chunk.cpp

obj/CSCIx229.o: src/CSCIx229.cpp src/CSCIx229.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/CSCIx229.o src/CSCIx229.cpp

obj/Generator.o: src/Generator.cpp src/Generator.h \
		src/Polygon.h \
		src/Vec3.h \
		src/Heightmap.h \
		src/Global.h \
		src/TriangleMesh.h \
		src/TerrainTexture.h \
		src/Perlin.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/Generator.o src/Generator.cpp

obj/GLWidget.o: src/GLWidget.cpp src/GLWidget.h \
		src/Polygon.h \
		src/Vec3.h \
		src/Camera3d.h \
		src/Map.h \
		src/Chunk.h \
		src/TriangleMesh.h \
		src/Global.h \
		src/TerrainTexture.h \
		src/Generator.h \
		src/Heightmap.h \
		src/Perlin.h \
		src/Skybox.h \
		src/CSCIx229.h \
		src/ParticleEngine.h \
		src/Particle.h \
		src/Object.h \
		src/BloomShader.h \
		src/ToonShader.h \
		src/WaterShader.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/GLWidget.o src/GLWidget.cpp

obj/Heightmap.o: src/Heightmap.cpp src/Heightmap.h \
		src/Global.h \
		src/Vec3.h \
		src/TriangleMesh.h \
		src/TerrainTexture.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/Heightmap.o src/Heightmap.cpp

obj/main.o: src/main.cpp src/MainWindow.h \
		src/GLWidget.h \
		src/Polygon.h \
		src/Vec3.h \
		src/Camera3d.h \
		src/Map.h \
		src/Chunk.h \
		src/TriangleMesh.h \
		src/Global.h \
		src/TerrainTexture.h \
		src/Generator.h \
		src/Heightmap.h \
		src/Perlin.h \
		src/Skybox.h \
		src/CSCIx229.h \
		src/ParticleEngine.h \
		src/Particle.h \
		src/Object.h \
		src/BloomShader.h \
		src/ToonShader.h \
		src/WaterShader.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/main.o src/main.cpp

obj/MainWindow.o: src/MainWindow.cpp src/MainWindow.h \
		src/GLWidget.h \
		src/Polygon.h \
		src/Vec3.h \
		src/Camera3d.h \
		src/Map.h \
		src/Chunk.h \
		src/TriangleMesh.h \
		src/Global.h \
		src/TerrainTexture.h \
		src/Generator.h \
		src/Heightmap.h \
		src/Perlin.h \
		src/Skybox.h \
		src/CSCIx229.h \
		src/ParticleEngine.h \
		src/Particle.h \
		src/Object.h \
		src/BloomShader.h \
		src/ToonShader.h \
		src/WaterShader.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/MainWindow.o src/MainWindow.cpp

obj/Map.o: src/Map.cpp src/Map.h \
		src/Chunk.h \
		src/TriangleMesh.h \
		src/Vec3.h \
		src/Global.h \
		src/TerrainTexture.h \
		src/Generator.h \
		src/Polygon.h \
		src/Heightmap.h \
		src/Perlin.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/Map.o src/Map.cpp

obj/Object.o: src/Object.cpp src/Object.h \
		src/CSCIx229.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/Object.o src/Object.cpp

obj/Particle.o: src/Particle.cpp src/Particle.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/Particle.o src/Particle.cpp

obj/ParticleEngine.o: src/ParticleEngine.cpp src/ParticleEngine.h \
		src/Particle.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/ParticleEngine.o src/ParticleEngine.cpp

obj/Perlin.o: src/Perlin.cpp src/Perlin.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/Perlin.o src/Perlin.cpp

obj/Polygon.o: src/Polygon.cpp src/Polygon.h \
		src/Vec3.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/Polygon.o src/Polygon.cpp

obj/Skybox.o: src/Skybox.cpp src/Skybox.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/Skybox.o src/Skybox.cpp

obj/TerrainTexture.o: src/TerrainTexture.cpp src/TerrainTexture.h \
		src/Global.h \
		src/Vec3.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/TerrainTexture.o src/TerrainTexture.cpp

obj/ToonShader.o: src/ToonShader.cpp src/ToonShader.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/ToonShader.o src/ToonShader.cpp

obj/TriangleMesh.o: src/TriangleMesh.cpp src/TriangleMesh.h \
		src/Vec3.h \
		src/Global.h \
		src/TerrainTexture.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/TriangleMesh.o src/TriangleMesh.cpp

obj/Vec3.o: src/Vec3.cpp src/Vec3.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/Vec3.o src/Vec3.cpp

obj/WaterShader.o: src/WaterShader.cpp src/WaterShader.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/WaterShader.o src/WaterShader.cpp

obj/moc_GLWidget.o: obj/moc_GLWidget.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/moc_GLWidget.o obj/moc_GLWidget.cpp

obj/moc_MainWindow.o: obj/moc_MainWindow.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o obj/moc_MainWindow.o obj/moc_MainWindow.cpp

####### Install

install:   FORCE

uninstall:   FORCE

FORCE:

