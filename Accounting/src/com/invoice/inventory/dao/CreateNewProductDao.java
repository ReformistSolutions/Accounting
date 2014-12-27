package com.invoice.inventory.dao;

import java.util.List;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.Details;


public interface CreateNewProductDao {
	
	public int save(CreateNewProduct createNewProduct);
	public List<CreateNewProduct> show();
	public List<CreateNewProduct> editCreateNewProduct(String productCode);
	public List<CreateNewProduct> viewPDFCreateNewProduct(String productCode);
	public List<CreateNewProduct> ViewCreateNewProduct(String productCode);
	public int updateProduct(CreateNewProduct createNewProduct);
	public CreateNewProduct generateID();
	//public List<CreateNewProduct> deleteCreateNewProduct(String productCode);
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public int delete(String productCode);
	public List<CreateNewProduct> showwarehouseDetails(String warehouseId);
	public List<CreateNewProduct> retriveProduct();
	public String retriveDesc(String productId);
	public String retriveUnit(String productId);
	public List<Details> showProductDetails(String productCode);
	public String ShowAdd();
	public String ShowDelete();
	public String ShowUpdate();
	public String ShowRestore();
	public String ShowNotAdd();
	public String ShowNotDelete();
	public String ShowNotUpdate();
	public String ShowNotRestore();
}
