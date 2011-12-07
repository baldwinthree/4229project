#include "GLWidget.h"

#include <QDebug>

#include <QPainter>
#include <unistd.h>

#include <time.h>




GLWidget::GLWidget(QWidget* parent) : QGLWidget(parent)
{
	setFormat(QGLFormat(QGL::DoubleBuffer | QGL::DepthBuffer));
	
	m_xrot = 15;
	m_yrot = 45;
	m_zrot = 0;	
	m_zoom = 1.0;
	
	m_speed = .05;
	
	m_ambient = 0.9; 
	m_diffuse = 1.0;  
	m_specular = 1.0;  
	m_xpos = 0;
	m_ypos = 20;
	m_zpos = 0;
	m_light_rotation = 0.0;
	
	m_counter = 0;
	
	m_current_xchunk = -99999;
	m_current_zchunk = -99999;
	
	m_fps_camera = true;
	m_initial_chunk = true;
	m_wireframe = false;
	m_displaying_particles = false;
	m_using_shaders = false;
	m_toon_lighting = false;
	m_dynamic_water = false;
	
	setFocusPolicy(Qt::StrongFocus);
	m_update_timer = new QTimer();
	connect(m_update_timer, SIGNAL(timeout()), this, SLOT(updateGL()));
	m_update_timer->start(1000/60.0);
}		


GLWidget::~GLWidget()
{
	qDebug() << "GLWidget destructor";
}


void GLWidget::toggleWireframe()
{
	if(m_wireframe)
	{
		glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
		m_wireframe = false;
	}
	else
	{
		glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
		m_wireframe = true;
	}
	
	updateGL();
}


void GLWidget::drawScene()
{
	if(m_polygons.size() != 0)
	{
		m_polygons.clear();
	}
	
	change_current_chunk();
	updateGL();
}

void GLWidget::toggleCameraMode()
{
	m_fps_camera = !m_fps_camera;
}

void GLWidget::toggleBloom()
{
	m_bloomShader->toggleShaders();
}

void GLWidget::toggleToonLighting()
{
	m_toon_lighting = !m_toon_lighting;
}

void GLWidget::toggleDynamicWater()
{
	m_dynamic_water = !m_dynamic_water;
}

void GLWidget::toggleParticles()
{
	m_displaying_particles = !m_displaying_particles;
	
	if(m_displaying_particles)
	{
		glEnable(GL_FOG);
		float fog_color[] = {1.0, 1.0, 1.0, 1.0};
		float fog_density[] = {0.4};
		glFogfv(GL_FOG_COLOR, fog_color);
		glFogfv(GL_FOG_DENSITY, fog_density);
	}
	else
	{
		glDisable(GL_FOG);
	}
}


////////////////////////
//     Protected
////////////////////////

void GLWidget::initializeGL()
{
	qglClearColor(Qt::black);
	glEnable(GL_DEPTH_TEST);
	glEnable (GL_BLEND);
	glBlendFunc (GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	glShadeModel(GL_SMOOTH);
	glEnable(GL_NORMALIZE);
	glEnable(GL_LIGHTING);
	glColorMaterial(GL_FRONT_AND_BACK,GL_AMBIENT_AND_DIFFUSE);
	glEnable(GL_COLOR_MATERIAL);
	
	glEnable(GL_CULL_FACE);
	
	if (GLEW_OK != glewInit())
	{
		qDebug() << "glewInit() failed!";
		exit(1);
	}
	
	if(m_displaying_particles)
	{
		glEnable(GL_FOG);
		float fog_color[] = {1.0, 1.0, 1.0, 1.0};
		float fog_density[] = {0.4};
		glFogfv(GL_FOG_COLOR, fog_color);
		glFogfv(GL_FOG_DENSITY, fog_density);
	}
	
	float ambient[] = {0.1, 0.1, 0.1, 1.0};
	glLightModelfv(GL_LIGHT_MODEL_AMBIENT, ambient);

	glEnable(GL_LIGHT0);
	glLighti(GL_LIGHT0, GL_NONE, 1);

	
	skybox = new Skybox();
	LoadOBJ("tree.obj");
	m_map = new Map();
	
	change_current_chunk();
	qDebug() << "HARP DARP" << m_nchunk;
	Heightmap * hm = m_nchunk->heightmap;
	m_particles = new ParticleEngine();
	
	//cam = new TerrainCamera(2.5,2.5,hm, m_map);
	cam = new Camera3d(0,1.0,0, m_map);
	
	m_bloomShader = new BloomShader();	
	
	m_toonShader = new ToonShader();
	m_waterShader = new WaterShader();
	
	m_fbo = new QGLFramebufferObject(1366, 768, QGLFramebufferObject::NoAttachment);
	
	glGenRenderbuffersEXT(1, &m_depthBuf);
}


void GLWidget::resizeGL(int width, int height)
{
	glViewport(0, 0, width, height);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	m_width = (height>0) ? (GLfloat)width/height : 1;
	gluPerspective(45, m_width, 0.1, 22);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
}

void GLWidget::paintGL()
{
	draw();
}

void GLWidget::updateGL()
{
	QGLWidget::updateGL();
}

void GLWidget::mousePressEvent(QMouseEvent* event)
{
	QGLWidget::mousePressEvent(event);
	m_lastPos = event->pos();
}

void GLWidget::mouseMoveEvent(QMouseEvent* event)
{
	QGLWidget::mouseMoveEvent(event);
	
	GLfloat dx = GLfloat(event->x() - m_lastPos.x()) / width();
	GLfloat dy = GLfloat(event->y() - m_lastPos.y()) / height();
	
	if(event->buttons() & Qt::LeftButton)
	{
		if(m_fps_camera)
		{
			cam->rotate(180*-dx,180*-dy);
		}
		else
		{
			m_xrot += 180 * dy;
			m_yrot += 180 * dx;
		}
		m_lastPos = event->pos();
	}	
}

void GLWidget::wheelEvent(QWheelEvent* event)
{
	if(m_fps_camera)
	{
		if(event->delta() > 0)
		{
			m_speed += .05;
		}
		else if(event->delta() < 0)
		{
			m_speed -= .05;
		}
	}
	else
	{	
		if(event->delta() > 0)
		{
			m_zoom += 0.1;
		}
		else if(event->delta() < 0)
		{
			m_zoom -= 0.1;
		}
	}
	
}

void GLWidget::keyPressEvent(QKeyEvent* event){

	switch(event->key())
	{
		case Qt::Key_W:
		{
			cam->move(m_speed);
			break;
		}
		case Qt::Key_S:
		{
			cam->move(-m_speed);
			break;
		}

		default:
			break;
	}
}


///////////////////////////
//       Private
///////////////////////////

void GLWidget::draw()
{	
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	
	//m_fbo->bind();
	
	//glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	m_zpos = sin(m_counter/500.0)*20;
	m_ypos = cos(m_counter/500.0)*20;
	m_counter++;
	glDisable(GL_DEPTH_TEST);
	cam->transformCamera();
	glPushMatrix();
		
	glLoadIdentity();
	glRotatef(-cam->pitch, 1.0,0.0,0.0);
	glRotatef(-cam->yaw, 0.0,1.0,0.0);
	skybox->draw();
		
		//glBindRenderbufferEXT(GL_RENDERBUFFER_EXT, m_depthBuf);
		//glRenderbufferStorageEXT(GL_RENDERBUFFER_EXT, GL_DEPTH_COMPONENT32, 1366, 768);
		//glFramebufferRenderbufferEXT( GL_FRAMEBUFFER_EXT, GL_DEPTH_ATTACHMENT_EXT, GL_RENDERBUFFER_EXT, m_depthBuf); 
		
		glEnable(GL_DEPTH_TEST);
	if(m_toon_lighting)
	{
		m_toonShader->bind();
	}
	
	change_current_chunk();
	
	if(m_fps_camera)
	{	

		glTranslatef(-2.5, 0, -2.5);
		if(m_displaying_particles)
		{
			m_particles->draw();
		}	
		glPopMatrix();
	}
	else
	{
		glTranslatef(0.0, 0.0, -7.0);
	
		glRotatef(m_xrot, 1.0, 0.0, 0.0);
		glRotatef(m_yrot, 0.0, 1.0, 0.0);
	
		glScalef(0.5, 0.5, 0.5);
		glScalef(m_zoom, m_zoom, m_zoom);
		
		if(m_displaying_particles)
		{
			m_particles->draw();
		}	
	}
	
	lighting();

	glPushMatrix();
	
	if(!m_fps_camera)
	{
		glTranslatef(m_map->curx-2.5, 0.0, m_map->curz-2.5);
	}
	
	if(m_dynamic_water)
	{
		m_waterShader->bind();
	}
	
	m_nchunk->draw();
	m_nwchunk->draw();
	m_wchunk->draw();
	m_swchunk->draw();
	m_schunk->draw();
	m_sechunk->draw();
	m_echunk->draw();
	m_nechunk->draw();
	m_centerchunk->draw();
	
	if(m_dynamic_water)
	{
		m_waterShader->release();
	}
	
	glPopMatrix();
	
	glLoadIdentity();
	char cameraLocation[100];
	sprintf(cameraLocation, "x:%2.3f y:%2.3f z:%2.3f yaw:%2.3f pitch:%2.3f", cam->x, cam->y, cam->z, cam->yaw, cam->pitch);
	glColor3f(1.0,1.0,1.0);
	renderText(0,30, cameraLocation);
	char chunkloc[80];
	sprintf(chunkloc, "Chunk (%4i, %4i)", m_map->curx, m_map->curz);
	renderText(0,50, chunkloc);
	
	if(m_toon_lighting)
	{
		m_toonShader->release();
	}
	
	//m_fbo->release();
	//glBindRenderbufferEXT(GL_RENDERBUFFER_EXT, 0);
	
	//m_bloomShader->draw(m_fbo->texture(), m_width);	
}

void GLWidget::lighting()
{
	float Ambient[] = {m_ambient, m_ambient, m_ambient, 1.0};
	float Diffuse[] = {m_diffuse, m_diffuse, m_diffuse, 1.0};
	float Specular[] = {m_specular, m_specular, m_specular, 1.0};
	float Position[] = {m_xpos, m_ypos, m_zpos, 0.0};
	glBegin(GL_LINES);
	glVertex3f(m_xpos, m_ypos, m_zpos);
	glVertex3f(0,0,0);
	glEnd();
	glLightfv(GL_LIGHT0, GL_AMBIENT , Ambient);
	glLightfv(GL_LIGHT0, GL_DIFFUSE , Diffuse);
	glLightfv(GL_LIGHT0, GL_SPECULAR, Specular);
	glLightfv(GL_LIGHT0, GL_POSITION, Position);
}

void GLWidget::gluPerspective(GLdouble fovy, GLdouble aspect, GLdouble zNear, GLdouble zFar)
{
   GLdouble xmin, xmax, ymin, ymax;

   ymax = zNear * tan(fovy * M_PI / 360.0);
   ymin = -ymax;
   xmin = ymin * aspect;
   xmax = ymax * aspect;

   glFrustum(xmin, xmax, ymin, ymax, zNear, zFar);
}


void GLWidget::change_current_chunk()
{
	if((m_current_xchunk == m_map->curx) && (m_current_zchunk == m_map->curz))
	{
		return;
	}
	m_current_xchunk = m_map->curx;
	m_current_zchunk = m_map->curz;
	m_nchunk = m_map->getChunkAt(m_map->curx, m_map->curz-1);
	m_nwchunk = m_map->getChunkAt(m_map->curx-1, m_map->curz-1);
	m_wchunk = m_map->getChunkAt(m_map->curx-1, m_map->curz);
	m_swchunk = m_map->getChunkAt(m_map->curx-1, m_map->curz+1);
	m_schunk = m_map->getChunkAt(m_map->curx, m_map->curz+1);
	m_sechunk = m_map->getChunkAt(m_map->curx+1, m_map->curz+1);
	m_echunk = m_map->getChunkAt(m_map->curx+1, m_map->curz);
	m_nechunk = m_map->getChunkAt(m_map->curx+1, m_map->curz-1);
	m_centerchunk = m_map->getChunkAt(m_map->curx, m_map->curz);
	
}








