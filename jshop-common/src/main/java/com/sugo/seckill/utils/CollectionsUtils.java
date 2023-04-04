package com.sugo.seckill.utils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;

/**
 * @ClassName CollectionsUtils
 * @Description TODO
 * @Author wesker
 * @Date 7/17/2019 6:06 PM
 * @Version 1.0
 **/
public class CollectionsUtils {

    private CollectionsUtils() {
    }

    public static <T> List<List<T>> groupList(Collection<T> data, Comparator<? super T> c) {
        //方法上使用泛型 记得在返回值前加<T>
        List<List<T>> result = new ArrayList<>();
        //1.循环取出集合中的每个元素
        for (T t : data) {
            //2.标志为不是同组
            boolean isSameGroup = false;
            //4.循环查找当前元素是否属于某个已创建的组
            for (List<T> aResult : result) {
                // aResult.get(0)表示：只要当前元素和某个组的第一个元素通过比较器比较相等则属于该组
                if (c.compare(t, aResult.get(0)) == 0) {
                    //5.查询到当前元素属于某个组则设置标志位，不让其创键新组
                    isSameGroup = true;
                    //6.把当前元素添加到当前组
                    aResult.add(t);
                    break;
                }
            }
            //3.不属于任何组的则创建一个新组，并把元素添加到该组
            if (!isSameGroup) {
                // 创建
                List<T> innerList = new ArrayList();
                innerList.add(t);
                result.add(innerList);
            }
        }
        return result;
    }
}
