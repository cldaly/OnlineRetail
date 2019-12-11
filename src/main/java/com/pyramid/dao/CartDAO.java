package com.pyramid.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.pyramid.model.Cart;

public class CartDAO {
	
	JdbcTemplate jdbc;

	public void setJdbc(JdbcTemplate jt) {
		this.jdbc = jt;
	}
	
	public int clearCartDetails() {
		return jdbc.update("truncate Cart");
	}
	
	public int addCartDetails(Cart c) {
		return jdbc.update("insert into cart (p_name,p_qty,total_p_price) values('"+c.getP_name()+"',"+c.getP_qty()+","+c.getTotal_p_price()+")");
	}
	
	
	public List<Cart> viewCartDetails(){
		return jdbc.query("select * from cart" , new RowMapper<Cart>() {
			public Cart mapRow(ResultSet r, int n) throws SQLException {
				Cart s = new Cart();
				s.setP_name(r.getString(2));
				s.setP_qty(r.getInt(3));
				s.setTotal_p_price(r.getDouble(4));
				return s;
			}
		});

	}
}
