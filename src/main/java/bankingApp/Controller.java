package bankingApp;
import bankingApp.Account;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Controller {
	public SqlSession session;
	public Controller() throws IOException {
		Reader reader = Resources.getResourceAsReader("/SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		session = sqlSessionFactory.openSession();
	}
	public int mybatisInsert(String name, String password, String repassword, String address,
			String phone, int amount) throws IOException {
		// TODO Auto-generated method stub
		// Create a new object
		Account account = new Account(name, password, repassword, address, phone, amount);
		System.out.println("Printing account info");
		System.out.println(account.toString());
		// Insert data
		int status =session.insert("Account.insert", account);
		System.out.println("record inserted successfully");
		session.commit();
		return account.getAcc_no();
	}

	public int checkLogin(int acc_no, String name, String password) throws IOException {
		// TODO Auto-generated method stub
		Account account = new Account(acc_no,name,password,"","","",0.0);
		int status = session.selectOne("Account.verify",account);
		return status;
	}

	
	
	public double checkBalance(int acc_no, String name, String password) throws IOException{
		// Create a new object
		Account account = new Account(acc_no, name, password,"","","",0.0);
		 // Insert data
		double amount = session.selectOne("Account.checkBalance", account);
		System.out.println("record checked successfully");
		return amount;
	}
	
	
	public double depositAmount(int acc_no, String name, String password, double amount) throws IOException {
//		// TODO Auto-generated method stub
		// Create a new object
		Account account = new Account(acc_no, name, password, "", "", "", amount);
		// Update data
		double bal = checkBalance( acc_no,  name,  password);
		account.setAmount(amount + bal);
		System.out.println("amount: " +account.getAmount());
		int status = session.update("Account.updateAmount", account);
		if(status==1) {
		System.out.println("record updated successfully");
		} else {
			System.out.println("Unable to update balance");
		}
		session.commit();
		return status==1?amount+bal:-1;
	}
//	
	public double withdrawAmount(int acc_no, String name, String password, double amount) throws IOException {
		// TODO Auto-generated method stub
		// Create a new object
		Account account = new Account(acc_no, name, password, "", "", "", amount);
		// Update data
		double bal = checkBalance( acc_no,  name,  password);
		if ( bal-amount>500) {
			account.setAmount(bal-amount);
			System.out.println("amount: " +account.getAmount());
			int status = session.update("Account.updateAmount", account);
			System.out.println("amount after: " +account.getAmount());
			session.commit();
			return status>0?bal-amount:-3;
		}
		else {
			session.commit();
			return -2;
		}
	}
	
	public double transferAmount(int acc_no, int tacc_no, String name, String password, double amount) throws IOException {
		// TODO Auto-generated method stub
		// Create a new object
		Account account = new Account(acc_no, name, password, "", "", "", amount);
		// Update data
		int checkAcc = session.selectOne("Account.checkAcc" ,tacc_no);
		System.out.println(checkAcc);
		double bal = checkBalance( acc_no,  name,  password);
		System.out.println(bal);
		if (checkAcc==1) {
			if ( bal-amount>500){
				account.setAmount(bal-amount);
				System.out.println("amount: " +account.getAmount());
				double status = session.update("Account.updateAmount", account);
				System.out.println("amount after: " +account.getAmount()); 
				Map<String, Object> parms = new HashMap<String, Object>();
				parms.put("acc_no", tacc_no);
				parms.put("amount", amount);
				double transfer_status = session.update("Account.transferDetails",parms);
				System.out.println(transfer_status); 
				session.commit();
				if (transfer_status>0) {
					return account.getAmount();
				}
				else {
					return -4;
				}
			}
			else {
				return -3;
			}
		}else {
			return -2;
		}
	}
	
	public int closeAccount(int acc_no, String name, String password) throws IOException {
		// TODO Auto-generated method stub
		// Create a new object
		Account account = new Account(acc_no, name, password, "", "", "", 0.0);
		// Update data
		int status = session.delete("Account.deleteAcc", acc_no);
		session.commit();
		System.out.println("record deleted successfully");
		return status;
	}
}