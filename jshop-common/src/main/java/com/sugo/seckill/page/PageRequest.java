package com.sugo.seckill.page;

import java.io.Serializable;

/**
 * Created by on 2019/5/22.
 */
public class PageRequest implements Serializable{

    private Integer currentPage=1;
    private Integer pageSize=10;

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
