package rikkei.academy.service;

import rikkei.academy.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public List<User> sortUsersByName();

    public List<User> searchUserByCountry(String country);

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;

    // Khai báo phương thức sửa thông tin người dùng
    void updateUserStore(User user);

    // Khai báo phương thức xóa người dùng
    void deleteUserStored(int userId) throws SQLException;

    // Khai báo phương thức hiển thị danh sách người dùng
    List<User> showUsersStore() throws SQLException;
}

