package com.report;

public class ReportBean {
	
	private String executeSetName;
	private String executor;
	private String release;
	private String buildLevel;
	private String status;
	
	private boolean hasFailed = false;
	private String startTime;
	public String getExecuteSetName() {
		return executeSetName;
	}
	public void setExecuteSetName(String executeSetName) {
		this.executeSetName = executeSetName;
	}
	public String getRelease() {
		return release;
	}
	public void setRelease(String release) {
		this.release = release;
	}
	public String getBuildLevel() {
		return buildLevel;
	}
	public void setBuildLevel(String buildLevel) {
		this.buildLevel = buildLevel;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public boolean isHasFailed() {
		return hasFailed;
	}
	public void setHasFailed(boolean hasFailed) {
		this.hasFailed = hasFailed;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getExecutor() {
		return executor;
	}
	public void setExecutor(String executor) {
		this.executor = executor;
	}
	@Override
	public int hashCode() {
		int hash = 7;
			hash = 31 * hash;
				hash = 31 * hash + (null == this.getExecuteSetName() ? 0 : this.getExecuteSetName().hashCode());
				return hash;
	}
	@Override
	public String toString() {
	
		return this.getExecuteSetName() +", " + this.getBuildLevel() + ", " + this.getRelease() + ", " + this.getStartTime() +", " + this.getStatus();
	}
}
