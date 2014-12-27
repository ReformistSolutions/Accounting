package com.invoice.inventory.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.Details;
import com.invoice.inventory.dao.CreateNewProductDao;

@Component(value="createNewProductService")
public class CreateNewProductServiceImplementation implements CreateNewProductService {

	private CreateNewProductDao createNewProductDao;
	
	
	
	public CreateNewProductDao getCreateNewProductDao() {
		return createNewProductDao;
	}


@Autowired
	public void setCreateNewProductDao(CreateNewProductDao createNewProductDao) {
		this.createNewProductDao = createNewProductDao;
	}


@Override
public int save(CreateNewProduct createNewProduct) {
	int i=createNewProductDao.save(createNewProduct);
	if(i>0)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}
@Override
public List<CreateNewProduct> show() {
	List<CreateNewProduct> showNewAddedProductList=new ArrayList<CreateNewProduct>();
	showNewAddedProductList=createNewProductDao.show();
	return showNewAddedProductList;
	
}
//Edit Create New Product
@Override
public List<CreateNewProduct> editCreateNewProduct(String producrtCode) {
	
	return createNewProductDao.editCreateNewProduct(producrtCode);
}
@Override
public int addProduct(CreateNewProduct CNP) {
	
	return 0;
}
@Override
public List<CreateNewProduct> ViewCreateNewProduct(String productCode) {
	
	return createNewProductDao.ViewCreateNewProduct(productCode);
}


@Override
public int updateProduct(CreateNewProduct createNewProduct) {
	
	return createNewProductDao.updateProduct(createNewProduct);
}


@Override
public CreateNewProduct generateID() {

	return createNewProductDao.generateID();
}


@Override
public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {

	return createNewProductDao.getInfo(companyDetails); 
}


@Override
public int delete(String productCode) {
 
	return createNewProductDao.delete(productCode);
}
@Override
public List<CreateNewProduct> showwarehouseDetails(String warehouseId) {

	return createNewProductDao.showwarehouseDetails(warehouseId);
}


@Override
public List<CreateNewProduct> retriveProduct() {
	
	return createNewProductDao.retriveProduct();
}


@Override
public String retriveDesc(String productId) {
	
	return createNewProductDao.retriveDesc(productId);
}


@Override
public String retriveUnit(String productId) {
	
	return createNewProductDao.retriveUnit(productId);
}


@Override
public List<Details> showProductDetails(String productCode) {
	
	return createNewProductDao.showProductDetails(productCode);
}
@Override
public String ShowAdd() 
{
	return createNewProductDao.ShowAdd();
}
@Override
public String ShowDelete() 
{
	return createNewProductDao.ShowDelete();
}
@Override
public String ShowUpdate() 
{
	return createNewProductDao.ShowUpdate();
}
@Override
public String ShowRestore() 
{
	return createNewProductDao.ShowRestore();
}
@Override
public String ShowNotAdd() 
{
	return createNewProductDao.ShowNotAdd();
}
@Override
public String ShowNotDelete() 
{
	return createNewProductDao.ShowNotDelete();
}
@Override
public String ShowNotUpdate() 
{
	return createNewProductDao.ShowNotUpdate();
}
@Override
public String ShowNotRestore() 
{
	return createNewProductDao.ShowNotRestore();
}


@Override
public List<CreateNewProduct> viewPDFCreateNewProduct(String productCode) 
{
	return createNewProductDao.viewPDFCreateNewProduct(productCode);
}
}
