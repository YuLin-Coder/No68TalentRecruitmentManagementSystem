package com.yjq.lagou.util;

import java.util.ArrayList;
import java.util.List;

import com.yjq.lagou.entity.common.PositionCategory;

public class PositionCategoryUtil {

	/**
	 * 获取一级职位类别
	 * @param allPositionCategories
	 * @return
	 */
	public static List<PositionCategory> getTopPositionCategory(List<PositionCategory> allPositionCategories){
		List<PositionCategory> topList = new ArrayList<PositionCategory>();
		for(PositionCategory positionCategory : allPositionCategories)
		{
			if(positionCategory.getParentId() == null || positionCategory.getParentId().getId() == null)
			{
				topList.add(positionCategory);
			}
		}
		
		return topList;
	}
	
	/**
	 * 获取二级职位类别
	 * @param allPositionCategories
	 * @return
	 */
	public static List<PositionCategory> getSecondCategory(List<PositionCategory> allPositionCategories){
		List<PositionCategory> secondList = new ArrayList<PositionCategory>();
		for(PositionCategory positionCategory : allPositionCategories)
		{
			if(positionCategory.getParentId() != null && positionCategory.getParentId().getId() != null)
			{
				if(positionCategory.getParentId().get_parentId() == null)
				{
					secondList.add(positionCategory);
				}
			}
		}
		
		return secondList;
	}
	
	/**
	 * 获取三级职位类别
	 * @param allPositionCategories
	 * @return
	 */
	public static List<PositionCategory> getThirdCategory(List<PositionCategory> allPositionCategories){
		List<PositionCategory> thirdList = new ArrayList<PositionCategory>();
		for(PositionCategory positionCategory : allPositionCategories)
		{
			if(positionCategory.getParentId() != null && positionCategory.getParentId().getId() != null)
			{
				if(positionCategory.getParentId().getParentId() != null && positionCategory.getParentId().getParentId().getId() != null)
				{
					if(positionCategory.getParentId().getParentId().get_parentId() == null)
					{
						thirdList.add(positionCategory);
					}
				}
			}
		}
		
		return thirdList;
	}
	
	/**
	 * 获取顶级类别下的快捷索引职位（每个二级类别下各获取一个三级类别）
	 * @param allPositionCategories
	 * @return
	 */
	public static List<PositionCategory> getQuickIndexCategory(List<PositionCategory> allPositionCategories)
	{
		List<PositionCategory> quickIndexList = new ArrayList<PositionCategory>();
		//获取二级类别
		List<PositionCategory> secondList = PositionCategoryUtil.getSecondCategory(allPositionCategories);
		//获取三级类别
		List<PositionCategory> thirdList = PositionCategoryUtil.getThirdCategory(allPositionCategories);
		for(PositionCategory secondCategory : secondList)
		{
			for(PositionCategory thirdCategory : thirdList)
			{
				if(thirdCategory.get_parentId() == secondCategory.getId())
				{
					quickIndexList.add(thirdCategory);
					break;
				}
			}
		}
		return quickIndexList;
	}
	
}
