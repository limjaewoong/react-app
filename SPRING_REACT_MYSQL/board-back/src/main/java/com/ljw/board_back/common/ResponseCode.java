package com.ljw.board_back.common;

public interface ResponseCode {

    // http status 200
    public static final String SUCCESS = "SU";

    // http status 400
    public static final String VALIDATE_FAILED = "VF";
    public static final String DUFLICATE_EMAIL = "DE";
    public static final String DUFLICATE_NICKNAME = "DN";
    public static final String DUFLICATE_TEL_NUMBER = "DT";
    public static final String NOT_EXISTED_USER = "NU";
    public static final String NOT_EXISTED_BOARD = "NB";

    // http STATUS 401
    String SIGN_IN_FAIL = "SF";
    String AUTHORIZATION_FAIL = "AF";

    // HTTP STATUS 403
    String NO_PERMISSION = "NP";

    // HTTP STATUS 500
    String DATEBASE_ERROR = "DBE";

    
}
