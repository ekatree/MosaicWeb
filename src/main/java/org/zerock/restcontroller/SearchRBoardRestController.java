package org.zerock.restcontroller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.RBoardVO;
import org.zerock.service.RBoardService;

@RestController
@RequestMapping("/rboard")
public class SearchRBoardRestController {

	
	static Logger logger = LoggerFactory.getLogger(SearchRBoardRestController.class);
	
	@Inject
	RBoardService service;
	
	@RequestMapping(value = "/list")
	public List<RBoardVO> listPage(Criteria cri) throws Exception{
		logger.info(cri.toString());
		
		List<RBoardVO> boards = service.listCriteria(cri);
			
		return boards;	//Marshall(마샬)
		
	}
	
	@RequestMapping(value = "/listAll")
	public ResponseEntity<String> listAll(Criteria cri, HttpServletResponse response) throws Exception{
		logger.info(cri.toString());
		response.setContentType("application/json");
		
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);	//Marshall(마샬)
		
	}
	
	
}
