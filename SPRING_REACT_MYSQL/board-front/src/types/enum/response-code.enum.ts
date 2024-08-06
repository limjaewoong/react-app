enum ResponseCode{
    // http status 200
    SUCCESS = "SU",

    // http status 400
    VALIDATE_FAILED = "VF",
    DUFLICATE_EMAIL = "DE",
    DUFLICATE_NICKNAME = "DN",
    DUFLICATE_TEL_NUMBER = "DT",
    NOT_EXISTED_USER = "NU",
    NOT_EXISTED_BOARD = "NB",

    // http STATUS 401
    SIGN_IN_FAIL = "SF",
    AUTHORIZATION_FAIL = "AF",

    
    // HTTP STATUS 403
    NO_PERMISSION = "NP",

    // HTTP STATUS 500
    DATEBASE_ERROR = "DBE",
}

export default ResponseCode;