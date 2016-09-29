package org.zerock.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.BoardVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
  
  @Inject
  private BoardService boardService;
  
  /**
   * Simply selects the home view to render by returning its name.
   */
  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String home(@ModelAttribute("cri") SearchCriteria cri, Locale locale, Model model) throws Exception {
    logger.info("Welcome home! The client locale is {}.", locale);
    logger.info(cri.toString());
    Date date = new Date();
    DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

    String formattedDate = dateFormat.format(date);
    //몇개 까지 불러 올것인지 셋팅 
    cri.setPerPageNum(99);
    //불러오기
    model.addAttribute("list", boardService.listSearchCriteria(cri));
    model.addAttribute("serverTime", formattedDate);
    
    //===========
    //{pageStart}, #{perPageNum}
    return "home";
  }
  
  @RequestMapping(value = "/doA", method = RequestMethod.GET)
  public String doA(Locale locale, Model model) {
    

    System.out.println("doA....................");
    
    return "home";
  }  
  
  @RequestMapping(value = "/doB", method = RequestMethod.GET)
  public String doB(Locale locale, Model model) {
    

    System.out.println("doB....................");
    
    model.addAttribute("result", "DOB RESULT");
    
    return "home";
  }  
  

  @RequestMapping(value = "/test", method = RequestMethod.GET)
  public void ajaxTest() {

  }

}
