package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.RBoardVO;
import org.zerock.domain.SearchCriteria;

public interface RBoardService {

  public void regist(RBoardVO board) throws Exception;

  public RBoardVO read(Integer bno) throws Exception;

  public void modify(RBoardVO board) throws Exception;

  public void remove(Integer bno) throws Exception;

  public List<RBoardVO> listAll() throws Exception;

  public List<RBoardVO> listCriteria(Criteria cri) throws Exception;

  public int listCountCriteria(Criteria cri) throws Exception;

  public List<RBoardVO> listSearchCriteria(SearchCriteria cri) 
      throws Exception;

  public int listSearchCount(SearchCriteria cri) throws Exception;
  
  
  public List<String> getAttach(Integer bno)throws Exception;
  

}
