package com.ljw.board_back.common;

public interface ResponseMessage {

    // http status 200
    public static final String SUCCESS = "Success";

    // http status 400
    public static final String VALIDATE_FAILED = "Validation Failed";
    public static final String DUFLICATE_EMAIL = "Duplicated email";
    public static final String DUFLICATE_NICKNAME = "Duplacate nickname";
    public static final String DUFLICATE_TEL_NUMBER = "Duplicate telnumber";
    public static final String NOT_EXISTED_USER = "this user does not exist";
    public static final String NOT_EXISTED_BOARD = "this board does not exist";

    // http STATUS 401
    String SIGN_IN_FAIL = "login information mismatch";
    String AUTHORIZATION_FAIL = "Authorization failed";

    // HTTP STATUS 403
    String NO_PERMISSION = "Do not have permission";

    // HTTP STATUS 500
    String DATEBASE_ERROR = "Databases error";

    
}
