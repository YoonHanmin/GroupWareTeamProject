package com.green.teamproject_groupware.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teamproject_groupware.dao.DocDao;
import com.green.teamproject_groupware.dto.DocDto;

@Service
public class DocServiceImpl implements DocService {

    @Autowired
    private DocDao docDao;

    @Override
    public List<DocDto> getAllDocuments() {
        return docDao.getAllDocuments();
    }

    @Override
    public DocDto getDocumentById(int doc_id) {
        return docDao.getDocumentById(doc_id);
    }

    @Override
    public void createDocument(DocDto document) {
        document.setDoc_status("대기");
        docDao.insertDocument(document);
    }

    @Override
    public void approveDocument(int documentId) {
        DocDto document = docDao.getDocumentById(documentId);
        document.setDoc_status("완료");
        docDao.updateDocument(document);
    }

    @Override
    public void rejectDocument(int documentId) {
        DocDto document = docDao.getDocumentById(documentId);
        document.setDoc_status("불가");
        docDao.updateDocument(document);
    }
}
