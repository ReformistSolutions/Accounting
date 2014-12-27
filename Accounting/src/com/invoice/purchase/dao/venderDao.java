package com.invoice.purchase.dao;

import java.util.List;

import com.invoice.purchase.beans.Vender;



public interface venderDao {

  public List<Vender> shwoDao();
  public int saveVender(Vender vender);
  public Vender auto();
  public List<Vender> viewVender(String venderId);
  public int updateVender(Vender vender);
  public int delete(String venderId);
  public int activeDelete(String venderId);
}
