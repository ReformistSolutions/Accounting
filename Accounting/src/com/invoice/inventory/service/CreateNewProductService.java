package com.invoice.inventory.service;

import java.util.List;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.Details;


public interface CreateNewProductService {
	public int save(CreateNewProduct createNewProduct);
	public List<CreateNewProduct> show();
	public List<CreateNewProduct> editCreateNewProduct(String producrtCode);
	public List<CreateNewProduct> viewPDFCreateNewProduct(String productCode);
	public List<CreateNewProduct> ViewCreateNewProduct(String productCode);
	public int updateProduct(CreateNewProduct createNewProduct);
	public CreateNewProduct generateID();
	int addProduct(CreateNewProduct CNP);
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





	
	