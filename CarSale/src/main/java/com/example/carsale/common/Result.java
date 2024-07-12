package com.example.carsale.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Result<T> {
    private Integer code;
    private Object data;
    private String msg;

    public static Result success() {
        return new Result(20000, null, "操作成功");
    }

    public static Result success(Object data) {
        return new Result(20000, data, "操作成功！");
    }

    public static Result error(String msg) {
        return new Result(500, null, msg);
    }

    public static Result error(Integer code, String msg) {
        return new Result(code, null, msg);
    }

    public static Result error() {
        return new Result(500, null, "系统错误！");
    }
}
