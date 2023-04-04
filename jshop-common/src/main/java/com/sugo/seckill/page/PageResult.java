package com.sugo.seckill.page;

import java.io.Serializable;
import java.util.List;

/**
 * Created by on 2019/3/14.
 */
public class PageResult implements Serializable {

    private Long total;

    private int page=1;

    private List<?> rows;

    private int pageSize=20;

    public PageResult() {
    }

    public PageResult(Long total, List<?> rows) {
        this.total = total;
        this.rows = rows;
    }

    public PageResult(Long total, List<?> rows,int page) {
        this.total = total;
        this.rows = rows;
        this.page = page;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public List<?> getRows() {
        return rows;
    }

    public void setRows(List<?> rows) {
        this.rows = rows;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
