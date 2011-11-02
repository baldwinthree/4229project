#include "Generator.h"

#include <math.h>
#include <QString>
#include <QDebug>

#include <time.h>


Generator::Generator()
{
	m_d = 0;
	m_seed = time(NULL);
	m_base_height_perlin = new Perlin(1, 1, 3, m_seed);
	m_detail_perlin = new Perlin(6, 2, 1, m_seed);
	m_chunk_size = 5;
}


Generator::~Generator()
{
	qDebug() << "Generator destructor";
	if(m_d != 0)
	{
		for(int i = 0; i < m_d; i++)
		{
			delete[] m_colors[i];
			delete[] m_vertices[i];
		}
		delete[] m_colors;
		delete[] m_vertices;
		delete[] m_default_translation;
		
		m_polys.clear();
	}
}
		


float* Generator::default_translation()
{
	m_default_translation = new float[3];
	m_default_translation[0] = -2.5;
	m_default_translation[1] = 0.0;
	m_default_translation[2] = -2.5;
	return m_default_translation;
}


void Generator::chunk_at(int chunk_x, int chunk_z)
{
	double start_time = clock()/1000;
	
	m_d = 4;
	float step = m_chunk_size/(m_d-1);
	float x,y,z;
	
	Vec3 color;
	
	m_vertices = new Vec3*[m_d];
	m_colors = new Vec3*[m_d];
	
	for(int i = 0; i<m_d;i++){
		m_vertices[i] = new Vec3[m_d];
		m_colors[i] = new Vec3[m_d];
		for(int j = 0; j<m_d; j++){
			z = (i*step) + (chunk_z*m_chunk_size);
			x = (j*step) + (chunk_x*m_chunk_size);
			y = base_height(x, z);
			y += m_detail_perlin->Get(x/5, z/5);
			y -= (y/4);
			y -= 0.5;
			
			if(y > 1.7)
			{
				y = 3.4 - y;
				if(y <= 0.8)
				{
					y = 0.8;
					color = Vec3(1.0, 0.0, 0.0);
				}
				else if(y > 0.8 && y < 1)
				{
					color = Vec3(0.2, 0.2, 0.2);
				}
				else
				{
					color = Vec3(0.1, 0.4, 0.1);
				}		
			}
			else if(y < -0.2)
			{
				y = -0.2;
				color = Vec3(0.0, 0.0, 0.6);
			}
			else if(y > -0.2 && y < -0.05)
			{
				color = Vec3(1.0, 1.0, 1.0);
			}
			else
			{
				color = Vec3(0.1, 0.4, 0.1);
			}
			
			m_vertices[i][j] = Vec3(x,y,z);
			m_colors[i][j] = color;

		}
	}
	
	qDebug() << "Generator::chunk_at() took" << (clock()/1000) - start_time << "milliseconds";
}


void Generator::islands(int i, int j, float step, int chunk_x, int chunk_z)
{
	float x, y, z;
	Vec3 color;
	z = (i*step) + (chunk_z*m_chunk_size);
	x = (j*step) + (chunk_x*m_chunk_size);
	y = base_height(x, z);
	y += m_detail_perlin->Get(x/5, z/5);
	y -= (y/4);
	y -= 0.5;
	
	if(y > 1.5)
	{
		y = 3 - y;
	}

	if(y < -0.2)
	{
		y = -0.2;
		color = Vec3(0.0, 0.0, 0.6);
	}
	else
	{
		color = Vec3(0.1, 0.4, 0.1);
	}
	
	m_vertices[i][j] = Vec3(x,y,z);
	m_colors[i][j] = color;
}



float Generator::base_height(float x, float z)
{
	float y = m_base_height_perlin->Get(x/15, z/15);	
	return y*y*2;
}


QList<Polygon*> Generator::polygons_at(int x, int z)
{
	m_polys.clear();
	
	if(m_d != 0)
	{
		for(int i = 0; i < m_d; i++)
		{
			delete[] m_colors[i];
			delete[] m_vertices[i];
		}
		delete[] m_colors;
		delete[] m_vertices;
		
		for(int i = 0; i < m_polys.size(); i++)
		{
			delete m_polys[i];
		}
		
		m_d = 0;
	}

	chunk_at(x, z);
	
	return m_polys;
}





