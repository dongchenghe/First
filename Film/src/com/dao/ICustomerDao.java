package com.dao;

import java.util.List;

import com.bean.Customer;

public interface ICustomerDao {
	List<Customer> getCustomers(Customer customer);
	Customer getCustomer(Customer customer);
	void   deleteCustomer(Customer customer);
	void updateCustomer(Customer customer);
	void addCustomer(Customer customer);
	Customer getCustomerByPhone(String phone);
}
