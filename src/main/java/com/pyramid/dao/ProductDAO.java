package com.pyramid.dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.pyramid.model.Product;

public class ProductDAO {

	JdbcTemplate jdbc;
	
	public void setJdbc(JdbcTemplate jt) {
		this.jdbc = jt;
	}
	
	public int saveProductDetails(Product p) throws DataAccessException, IOException {
		return jdbc.update("insert into product (name,price,category,image) values ('" + p.getName() + "', " + p.getPrice() + ", '" + p.getCategory() + "','"+p.getImage()+"')");
		
	}
	public List<Product> searchProduct(String categoryName) {
		return jdbc.query("select * from product where category = '"+categoryName + "'", new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product p = new Product(rs.getString(2),rs.getDouble(3),rs.getString(4),rs.getBytes(5));
				p.getName();
				p.getPrice();
				p.getCategory();
				p.getImage();
				return p;
			}
		});
	}
	
	public List<Product> getProductDetails() {
		return jdbc.query("select * from product", new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product p = new Product();
				p.setName(rs.getString(2));
				p.setPrice(rs.getDouble(3));
				p.setCategory(rs.getString(4));
				return p;
			}
		});
	}
	
	public Product getProductByName(String p_name) {
		List<Product> p=jdbc.query("select * from product where name = '"+p_name + "'", new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product p = new Product(rs.getString(2),rs.getDouble(3),rs.getString(4),rs.getBytes(5));
				p.getName();
				p.getPrice();
				p.getCategory();
				return p;
			}
		});
		
		if(!p.isEmpty()) {
			return p.get(0);
			
		}
		return null;
	}
	
}
