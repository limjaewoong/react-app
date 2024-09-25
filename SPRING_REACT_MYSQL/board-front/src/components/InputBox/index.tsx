import {forwardRef} from "react";
import './style.css';

interface Props{

}

const inputBox = forwardRef<HTMLInputElement, Props>((props:Props, ref)=>{
    return(
        <div className="inputbox">
            <div className="inputbox-label">{'비밀번호*'}</div>
            <div className="inputbox-container">
                <input className="input"/>
                <div className="icon-button">
                    <div className=""></div>
                </div>
            </div>
            <div className="inputbox-message">{'비밀번호는 8자 이상 입력해주세요'}</div>
        </div>
    )
});

export default inputBox;