package com.service;

import com.model.Testpaper;

import java.util.List;

public interface TestpaperService extends BaseService {
    List<Testpaper> selectByTestid(String id);
}
