package bankingApp;

public class Account {
	int acc_no;
	String name;
	String password;
	String repassword;
	String address;
	String phone;
	double amount;
	
	public Account(String name, String password, String repassword, String address, String phone, double amount) {
		super();
		this.name = name;
		this.password = password;
		this.repassword = repassword;
		this.address = address;
		this.phone = phone;
		this.amount = amount;
	}
	
	public Account(int acc_no, String name, String password, String repassword, String address, String phone, double amount) {
		super();
		this.acc_no = acc_no;
		this.name = name;
		this.password = password;
		this.repassword = repassword;
		this.address = address;
		this.phone = phone;
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "Account [acc_no=" + acc_no + ", name=" + name + ", password=" + password + ", repassword=" + repassword
				+ ", address=" + address + ", amount=" + amount + ", phone=" + phone + "]";
	}
	public int getAcc_no() {
		return acc_no;
	}
	public void setAcc_no(int acc_no) {
		this.acc_no = acc_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}	
}

