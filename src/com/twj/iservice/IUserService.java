package com.twj.iservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.twj.dao.UserDao;
import com.twj.entity.User;
import com.twj.util.Page;

public interface IUserService {
	
	public void register(User user);
	public User login(String name, String psd);
	public User getUserById(int uId);

	public List<User> getUserByList(Page<User> page);
	
	public Long getUserByListLong();
}
