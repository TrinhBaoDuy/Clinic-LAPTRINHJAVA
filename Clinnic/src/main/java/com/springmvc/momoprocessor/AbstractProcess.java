package com.springmvc.momoprocessor;

//import com.google.gson.Gson;
//import com.google.gson.GsonBuilder;
//import com.mservice.config.Environment;
//import com.mservice.config.PartnerInfo;
//import com.mservice.shared.exception.MoMoException;
//import com.mservice.shared.utils.Execute;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.springmvc.dto.momoclasses.Environment;
import com.springmvc.dto.momoclasses.PartnerInfo;
import com.springmvc.share.exception.MoMoException;
import com.springmvc.share.utils.Execute;

/**
 * @author hainguyen
 * Documention: https://developers.momo.vn
 */

public abstract class AbstractProcess<T, V> {

    protected PartnerInfo partnerInfo;
    protected Environment environment;
    protected Execute execute = new Execute();

    public AbstractProcess(Environment environment) {
        this.environment = environment;
        this.partnerInfo = environment.getPartnerInfo();
    }

    public static Gson getGson() {
        return new GsonBuilder()
                .disableHtmlEscaping()
                .create();
    }

    public abstract V execute(T request) throws MoMoException;
}
