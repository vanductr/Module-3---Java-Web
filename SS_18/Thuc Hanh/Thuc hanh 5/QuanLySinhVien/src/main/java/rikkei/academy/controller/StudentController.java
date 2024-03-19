package rikkei.academy.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;
import rikkei.academy.model.Student;
import rikkei.academy.service.StudentServiceIMPL;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
@Controller
public class StudentController {
    @Autowired
    private StudentServiceIMPL studentServiceIMPL;

    @GetMapping(value = {"/","/students"})
    public ModelAndView showList() {
        ModelAndView modelAndView = new ModelAndView("students/list");
        List<Student> studentList = studentServiceIMPL.findAll();
        modelAndView.addObject("students", studentList);
        return modelAndView;
    }
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Long id, HttpServletRequest request) {
        System.out.println("detail");
        System.out.println("id" + id);
        Long _id = id-1;
        Student student = studentServiceIMPL.findById(_id);
        request.setAttribute("student", student);
        return "/students/info";
    }
}

