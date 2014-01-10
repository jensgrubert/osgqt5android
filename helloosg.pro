

## uncomment if using android kit
#CONFIG += OSGANDROID

OSGANDROID {
OSG_DIR="c:/openscenegraph/svn/OpenSceneGraph/build-android-opengles2"
OSG_LIBDIR=$$OSG_DIR/lib/armeabi-v7a/debug

} else {
    OSG_DIR="c:/openscenegraph/svn/OpenSceneGraph/build-mingw32"
}

QT       += core gui widgets

TARGET = helloosg
TEMPLATE = app


SOURCES += main.cpp \
           ViewerWidget.cpp \
           GraphicsWindowQt.cpp \


INCLUDEPATH += $$OSG_DIR/include

qtHaveModule(opengl) {
    QT += opengl

    SOURCES += mainwidget.cpp \
       geometryengine.cpp

    HEADERS += \
        mainwidget.h \
        geometryengine.h\
        ViewerWidget.h \
        GraphicsWindowQt.h


    RESOURCES += \
        shaders.qrc \
        textures.qrc

#android
OSGANDROID {
    LIBS += $$OSG_LIBDIR/libosgd.a\
            $$OSG_LIBDIR/libosgDBd.a\
            $$OSG_LIBDIR/libosgUtild.a\
            $$OSG_LIBDIR/libosgGAd.a\
            $$OSG_LIBDIR/libosgViewerd.a
} else {
#mingw32
    LIBS += $$OSG_DIR/lib/libOpenThreadsd.dll.a\
                 $$OSG_DIR/lib/libosgd.dll.a\
                 $$OSG_DIR/lib/libosgDBd.dll.a\
                 $$OSG_DIR/lib/libosgUtild.dll.a\
                 $$OSG_DIR/lib/libosgGAd.dll.a\
                 $$OSG_DIR/lib/libosgViewerd.dll.a\
                 $$OSG_DIR/lib/libosgWidgetd.dll.a#\
                # $$OSG_DIR/lib/libosgQtd.dll.a
}

# MSVC 2012
#    LIBS += $$OSG_DIR/lib/OpenThreadsd.lib\
#                $$OSG_DIR/lib/osgd.lib\
#                 $$OSG_DIR/lib/osgDBd.lib\
#                 $$OSG_DIR/lib/osgUtild.lib\
#                 $$OSG_DIR/lib/osgGAd.lib\
#                 $$OSG_DIR/lib/osgViewerd.lib\
#                 $$OSG_DIR/lib/osgWidgetd.lib\
#                 $$OSG_DIR/lib/osgQtd.lib
}

# install
target.path = $$[QT_INSTALL_EXAMPLES]/opengl/helloosg
INSTALLS += target

