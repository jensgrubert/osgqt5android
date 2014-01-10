#ifndef VIEWERWIDGET_H
#define VIEWERWIDGET_H

#include <QTimer>
#include <QApplication>
#include <QGridLayout>

#include <osgViewer/CompositeViewer>
#include <osgViewer/ViewerEventHandlers>

#include <osgGA/TrackballManipulator>

#include <osgDB/ReadFile>

//#include <osgQt/GraphicsWindowQt>
#include "GraphicsWindowQt.h"

class ViewerWidget : public QWidget, public osgViewer::CompositeViewer
{
    Q_OBJECT

public:
  ViewerWidget(osgViewer::ViewerBase::ThreadingModel threadingModel=osgViewer::CompositeViewer::SingleThreaded);
  QWidget* addViewWidget( osgQt::GraphicsWindowQt* gw, osg::Node* scene );
  osgQt::GraphicsWindowQt* createGraphicsWindow( int x, int y, int w, int h, const std::string& name="", bool windowDecoration=false );
  virtual void paintEvent( QPaintEvent* event );
  
 protected:
    QTimer _timer;
};

#endif // VIEWERWIDGET_H
