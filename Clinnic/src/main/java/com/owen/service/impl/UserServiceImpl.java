/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.owen.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.owen.pojo.User;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.owen.repository.UserRepository;
import com.owen.service.UserService;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 *
 * @author Trinh Bao Duy //
 */
@Service("userDetailsService")
//@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private UserRepository userRepo;

    @Override
    public List<User> getUsers(Map<String, String> params) {
        return this.userRepo.getUsers(params);
    }

    @Override
    public Long countUser() {
        return this.userRepo.countUser();
    }

    @Override
    public boolean deleteUser(int id) {
        return this.userRepo.deleteUser(id);
    }

    @Override
    public List<User> searchUsersByName(Map<String, String> name) {
        return this.userRepo.searchUsersByName(name);
    }

    @Override
    public boolean addOrUpdateUser(User u) {
        if (!u.getFile().isEmpty()) {
            try {
                Map r = this.cloudinary.uploader().upload(u.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                String avatar = (String) r.get("secure_url");
                u.setAvatar(avatar);

            } catch (IOException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return this.userRepo.addOrUpdateUser(u);
    }

    @Override
    public User getUserById(int id) {
        return this.userRepo.getUserById(id);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User u = this.userRepo.getUserByUsername(username);
        if (u == null) {
            throw new UsernameNotFoundException("Invalid");
        }
        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority(u.getRoleId().getName()));
        return new org.springframework.security.core.userdetails.User(
                u.getUsername(), u.getPassword(), authorities);
    }

    @Override
    public User getUserByUsername(String username) {
           return  this.userRepo.getUserByUsername(username);
      }

}
