#include "Polygon.h"

#include <QDebug>

Polygon::Polygon()
{
	m_vertices.append(Vec3(-0.5, -0.5, 0.0));
	m_vertices.append(Vec3(0.5, -0.5, 0.0));
	m_vertices.append(Vec3(0.5, 0.5, 0.0));
	m_vertices.append(Vec3(-0.5, 0.5, 0.0));
}

Polygon::Polygon(Vec3 v1, Vec3 v2, Vec3 v3, Vec3 v4, Vec3 c1, Vec3 c2, Vec3 c3, Vec3 c4)
{
	m_vertices.append(v1);
	m_vertices.append(v2);
	m_vertices.append(v3);
	m_vertices.append(v4);
	m_colors.append(c1);
	m_colors.append(c2);
	m_colors.append(c3);
	m_colors.append(c4);
}

void Polygon::set_vertices(Vec3 v1, Vec3 v2, Vec3 v3, Vec3 v4)
{
	m_vertices.clear();
	m_vertices.append(v1);
	m_vertices.append(v2);
	m_vertices.append(v3);
	m_vertices.append(v4);
}


void Polygon::set_colors(Vec3 c1, Vec3 c2, Vec3 c3, Vec3 c4)
{
	m_colors.clear();
	m_colors.append(c1);
	m_colors.append(c2);
	m_colors.append(c3);
	m_colors.append(c4);
}


QList<float*> Polygon::get_vertices()
{
	QList<float*> ret;

	for(int i = 0; i < 4; i++)
	{
		float *vec = new float[3];
		vec[0] = m_vertices[i].x;
		vec[1] = m_vertices[i].y;
		vec[2] = m_vertices[i].z;
		ret.append(vec);
	}
	return ret;
}


QList<float*> Polygon::get_colors()
{
	QList<float*> ret;
	
	for(int i = 0; i < 4; i++)
	{
		float* col = new float[3];
	
		col[0] = m_colors[i].x;
		col[1] = m_colors[i].y;
		col[2] = m_colors[i].z;
		
		ret.append(col);
	}
	return ret;
}


float* Polygon::get_normal()
{
	float* norm = new float[3];
	
	Vec3 U = m_vertices[1] - m_vertices[0];
	Vec3 V = m_vertices[2] - m_vertices[0];
	
	norm[0] = (U.y * V.z) - (U.z * V.y);
	norm[1] = (U.z * V.x) - (U.x * V.z);
	norm[2] = (U.x * V.y) - (U.y * V.x); 
	
	return norm;
}



