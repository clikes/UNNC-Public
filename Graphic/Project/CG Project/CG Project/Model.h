#pragma once
#include "baseheader.h"

#ifndef TINY_OBJ_LOADER_H
#define TINY_OBJ_LOADER_H
#define TINYOBJLOADER_IMPLEMENTATION
#include "lib/tiny_obj_loader.h"
#endif

class Model
{
public:
	tinyobj::attrib_t attrib;
	std::vector<tinyobj::shape_t> shapes;
	std::vector<tinyobj::material_t> materials;
	vector<GLfloat> vertex;
	vector<GLfloat> normal;
	vector<GLfloat> texcood;
	GLuint VAOId, VBOId;
	int vertexcount;
	Model(const string filename)
	{
		std::string warn;
		std::string err;
		bool ret = tinyobj::LoadObj(&attrib, &shapes, &materials, &warn, &err, filename.c_str());
		int faceCount = 0;
		faceCount = shapes[0].mesh.num_face_vertices.size();
		printf("shape.size: %d attrib.vertices.size: %d\n", shapes.size(), faceCount);
		std::vector<GLfloat> vertices(4608);
		std::vector<GLshort> faces;

		//glBufferData(GL_ELEMENT_ARRAY_BUFFER,
		//sizeof(shapes[0].mesh.num_face_vertices.size() * sizeof(GLshort)), shapes[0].mesh.num_face_vertices, GL_STATIC_DRAW);

		if (!err.empty()) { // print error message
			std::cerr << err << std::endl;
		}

		if (!ret) {
			std::cerr << "Load Model " + filename + " failed!" << std::endl;
			return;
		}

		vertexcount = 0;
		vertex.clear();
		normal.clear();
		texcood.clear();

		size_t index_offset = 0;
		for (size_t s = 0; s < shapes.size(); s++) {
			vertexcount += shapes[s].mesh.num_face_vertices.size();
			for (size_t f = 0; f < shapes[s].mesh.num_face_vertices.size(); f++) {
				int fv = shapes[s].mesh.num_face_vertices[f];
				// Loop over vertices in the face.
				for (size_t v = 0; v < fv; v++) {
					// access to vertex
					tinyobj::index_t idx = shapes[s].mesh.indices[index_offset + v];
					tinyobj::real_t vx = attrib.vertices[3 * idx.vertex_index + 0];
					tinyobj::real_t vy = attrib.vertices[3 * idx.vertex_index + 1];
					tinyobj::real_t vz = attrib.vertices[3 * idx.vertex_index + 2];
					tinyobj::real_t nx = attrib.normals[3 * idx.normal_index + 0];
					tinyobj::real_t ny = attrib.normals[3 * idx.normal_index + 1];
					tinyobj::real_t nz = attrib.normals[3 * idx.normal_index + 2];
					tinyobj::real_t tx = attrib.texcoords[2 * idx.texcoord_index + 0];
					tinyobj::real_t ty = attrib.texcoords[2 * idx.texcoord_index + 1];
					vertex.push_back(vx);
					vertex.push_back(vy);
					vertex.push_back(vz);
					normal.push_back(nx);
					normal.push_back(ny);
					normal.push_back(nz);
					texcood.push_back(tx);
					texcood.push_back(ty);

				}
				index_offset += fv;
			}
		}

		/*glGenVertexArrays(1, &this->VAOId);
		glGenBuffers(1, &this->VBOId);
		
		glBindVertexArray(this->VAOId);
		glBindBuffer(GL_ARRAY_BUFFER, this->VBOId);
		glBufferData(GL_ARRAY_BUFFER, sizeof(GLshort)* faces.size(),
			faces.data(), GL_STATIC_DRAW);*/
		// 顶点位置属性
		//glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE,
		//	sizeof(GL_FLOAT) * 8, (GLvoid*)0);
		//glVertexPointer(3, GL_FLOAT, sizeof(GL_FLOAT) * 5, vertices.data());
		//glNormalPointer(GL_FLOAT, sizeof(GL_FLOAT) * 5, vertices.data());
		//glVertexPointer(2, GL_FLOAT, sizeof(GL_FLOAT) * 6, vertices.data());
		//glEnableVertexAttribArray(0);
		//// 顶点法向量属性
		//glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE,
		//	sizeof(GL_FLOAT) * 8, (GLvoid*)(3 * sizeof(GL_FLOAT)));
		//glEnableVertexAttribArray(1);
		//// 顶点纹理坐标
		//glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE,
		//	sizeof(GL_FLOAT) * 8, (GLvoid*)(6 * sizeof(GL_FLOAT)));
		//glEnableVertexAttribArray(2);

		//glBindBuffer(GL_ARRAY_BUFFER, 0);

		//glBindVertexArray(0);

	}

	~Model();
};

