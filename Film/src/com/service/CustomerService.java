package com.service;
import java.util.List;

import com.bean.Customer;
import com.dao.ICustomerDao;

public class CustomerService implements ICustomerService{
	private ICustomerDao dao;

	



	public ICustomerDao getDao() {
		return dao;
	}

	public void setDao(ICustomerDao dao) {
		this.dao = dao;
	}

	@Override
	public List<Customer> getCustomers(Customer customer) {
		return dao.getCustomers(customer);
	}

	@Override
	public Customer getCustomer(Customer customer) {
		return dao.getCustomer(customer);
	}

	@Override
	public void deleteCustomer(Customer customer) {
		dao.deleteCustomer(customer);
		
	}

	@Override
	public void updateCustomer(Customer customer) {
		dao.updateCustomer(customer);
		
	}

	@Override
	public void addCustomer(Customer customer) {
		dao.addCustomer(customer);
		
	}

	@Override
	public Customer getCustomerByPhone(String phone) {
		// TODO Auto-generated method stub
		return dao.getCustomerByPhone(phone);
	}
	
	
}
