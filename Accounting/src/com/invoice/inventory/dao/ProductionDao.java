package com.invoice.inventory.dao;

import java.util.List;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.Production;
import com.invoice.inventory.beans.ProductionDetails;
import com.invoice.inventory.beans.RawMaterialDetails;
import com.invoice.sales.beans.Order;

public interface ProductionDao 
{

	 public Production generateId();
	 public List<Order> showOrder(); 
	 public List<ProductionDetails> retrivepProductDetails(String orderID);
	 public List<RawMaterialDetails> retriveRawMaterial(String productId,float qty);
	 public List<RawMaterialDetails> retriveRawMaterialList();
	 public String retriveRMDesc(String rmId);
	 public float retriveRMQty(String rmId,String productId);
	 public String retriveProductDesc(String productId);
	 public float retriveProductQty(String productId);
	 public String retriveProductUnit(String productId);
	 public int save(Production production);
	 public List<Production> showPending();
	 public List<Production> showCompleted();
	 public int completeProductionOrder(Production production);
	 public int deleteProductionOrder(String productionId);
	 public List<Production> edit(String productionId);
	 public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	 public List<RawMaterialDetails> showRawMaterial(String productionId,String productId);
	 public int updateProduction(Production production);
}
