package com.green.teamproject_groupware.controller;

import com.green.teamproject_groupware.dao.DocDao;
import com.green.teamproject_groupware.dto.DocDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class DocController extends HttpServlet {

	private DocDao docDao = new DocDao() {

		@Override
		public void updateDocument(DocDto document) {
			// TODO Auto-generated method stub

		}

		@Override
		public void insertDocument(DocDto document) {
			// TODO Auto-generated method stub

		}

		@Override
		public DocDto getDocumentById(int doc_id) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public List<DocDto> getAllDocuments() {
			// TODO Auto-generated method stub
			return null;
		}
	};

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getPathInfo();
		if (path == null || path.equals("/")) {
			List<DocDto> documents = docDao.getAllDocuments();
			request.setAttribute("documents", documents);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/documents.jsp");
			dispatcher.forward(request, response);
		} else {
			int id = Integer.parseInt(path.substring(1));
			DocDto document = docDao.getDocumentById(id);
			if (document != null) {
				request.setAttribute("document", document);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/document.jsp");
				dispatcher.forward(request, response);
			} else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getPathInfo();
		if (path.equals("/create")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			DocDto document = new DocDto();
			document.setDoc_title(title);
			document.setDoc_content(content);
			document.setDoc_status("대기");

			docDao.insertDocument(document);
			response.sendRedirect(request.getContextPath() + "/documents");
		} else if (path.startsWith("/approve/")) {
			int documentId = Integer.parseInt(path.substring(9));
			DocDto document = docDao.getDocumentById(documentId);
			if (document != null) {
				document.setDoc_status("완료");
				docDao.updateDocument(document);
				response.sendRedirect(request.getContextPath() + "/documents");
			} else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
			}
		} else if (path.startsWith("/reject/")) {
			int documentId = Integer.parseInt(path.substring(8));
			DocDto document = docDao.getDocumentById(documentId);
			if (document != null) {
				document.setDoc_status("불가");
				docDao.updateDocument(document);
				response.sendRedirect(request.getContextPath() + "/documents");
			} else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
			}
		}
	}
}