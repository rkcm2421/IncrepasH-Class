package com.hclass.www.services;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.*;

import com.hclass.www.DAO.*;
import com.hclass.www.vo.*;

public class BoardService {
	@Autowired
	BoardDAO bDAO;
	@Autowired
	FileService fSrvc;
	
	public ModelAndView boardGet(int bno, ModelAndView mv) {
		HashMap map = bDAO.boardDetail(bno);
		List<FileVO> list = bDAO.fileInfo(bno);
		// 데이터 보내고
		mv.addObject("DATA", map);
		mv.addObject("LIST", list);
		return mv;
	}
	
	// 게시판 테이블 글 등록 처리 서비스 함수
	public void insertBrd(BoardVO bVO, FileVO fileVO) {
		bDAO.addBrd(bVO);
		fSrvc.insertFileInfo(bVO, fileVO);
	}
}
