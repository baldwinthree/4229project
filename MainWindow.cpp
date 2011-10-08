#include "MainWindow.h"

#include <QDesktopWidget>
#include <QApplication>

MainWindow::MainWindow(QWidget *parent, Qt::WindowFlags flags) : QMainWindow(parent, flags)
{
	m_width = 800;
	m_height = 600;
	
	int x = (QApplication::desktop()->width()-m_width)/2;
	int y = (QApplication::desktop()->height()-m_height)/2;
	setGeometry(x, y, m_width, m_height);
	
	m_menuBar = new QMenuBar();
	m_fileMenu = m_menuBar->addMenu("File");
	m_quitAction = m_fileMenu->addAction("Quit");
	m_quitAction->setShortcut(QKeySequence::Quit);
	connect(m_quitAction, SIGNAL(triggered()), this, SLOT(close()));
	setMenuBar(m_menuBar);
		
	m_toolBar = new QToolBar();
	addToolBar(Qt::TopToolBarArea, m_toolBar);
	
	m_fullScreenAction = m_toolBar->addAction("Toggle Fullscreen");
	
	connect(m_fullScreenAction, SIGNAL(triggered()), this, SLOT(toggleFullscreen()));
	
	m_glWidget = new GLWidget();
	setCentralWidget(m_glWidget);
	
	m_fullscreen = false;
}

////////////////////////////////////////
//           Slots
////////////////////////////////////////

void MainWindow::toggleFullscreen()
{
	if(m_fullscreen)
	{
		showNormal();
		m_fullscreen = false;
	}
	else
	{
		showFullScreen();
		m_fullscreen = true;
	}
}
