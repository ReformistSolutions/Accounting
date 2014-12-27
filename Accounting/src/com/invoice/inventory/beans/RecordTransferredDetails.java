package com.invoice.inventory.beans;

public class RecordTransferredDetails {
	
		private int txtSrNo1;
		private String itemID;
		private String txtItem1;
		private float txtQuant1;
		private String desti_warehouseId;
		private String destWarehouse1;
		private String availableqty;
		
		
		
		public String getAvailableqty() {
			return availableqty;
		}
		public void setAvailableqty(String availableqty) {
			this.availableqty = availableqty;
		}
		
		public int getTxtSrNo1() {
			return txtSrNo1;
		}
		public void setTxtSrNo1(int txtSrNo1) {
			this.txtSrNo1 = txtSrNo1;
		}
		public String getItemID() {
			return itemID;
		}
		public void setItemID(String itemID) {
			this.itemID = itemID;
		}
		public String getTxtItem1() {
			return txtItem1;
		}
		public void setTxtItem1(String txtItem1) {
			this.txtItem1 = txtItem1;
		}
		
		public float getTxtQuant1() {
			return txtQuant1;
		}
		public void setTxtQuant1(float txtQuant1) {
			this.txtQuant1 = txtQuant1;
		}
		public String getDesti_warehouseId() {
			return desti_warehouseId;
		}
		public void setDesti_warehouseId(String desti_warehouseId) {
			this.desti_warehouseId = desti_warehouseId;
		}
		public String getDestWarehouse1() {
			return destWarehouse1;
		}
		public void setDestWarehouse1(String destWarehouse1) {
			this.destWarehouse1 = destWarehouse1;
		}
		
		
	}



