/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
 package  com.milknest.milknest_online_services ;

    import java.sql.Connection ;
    import java.sql.PreparedStatement ;
    import java.sql.SQLException ;
/**
 *
 * @author Santosh
 */
public class User {

        public int UserID;
        public String Username;
        public String Usercontact;
        public String Useremail;
        public String UserPassword;

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getUsercontact() {
        return Usercontact;
    }

    public void setUsercontact(String Usercontact) {
        this.Usercontact = Usercontact;
    }

    public String getUseremail() {
        return Useremail;
    }

    public void setUseremail(String Useremail) {
        this.Useremail = Useremail;
    }

    public String getUserPassword() {
        return UserPassword;
    }

    public void setUserPassword(String UserPassword) {
        this.UserPassword = UserPassword;
    }

        public boolean insertUser(User c) throws SQLException {

            //connector connector = new connector();
            Connection cn = DataAccess.getConnection();
            PreparedStatement ps = cn.prepareStatement("INSERT INTO tb_usermaster(Username,Usercontact,Useremail,UserPassword) VALUES(?,?,?,?)");

            ps.setString(1, c.getUsername());
            ps.setString(2, c.getUsercontact());
            ps.setString(3, c.getUseremail());
            ps.setString(4, c.getUserPassword());

            int i = ps.executeUpdate();

            if (i == 1) {

                return true;

            }

            return false;

        }

    }