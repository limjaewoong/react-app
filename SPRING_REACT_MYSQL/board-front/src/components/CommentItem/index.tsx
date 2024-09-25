import React from "react";
import './style.css';
import { CommentListItem } from "types/interface";
import defaultProfileImage from 'assets/images/default_avatar_profile.jpg';

interface Props{
    commentListItem : CommentListItem; 
}

// component: Comment list item 컴포넌트
export default function CommentItem({commentListItem}: Props){

    const {nickname
         ,profileImage
         ,writeDateTime
         ,content} = commentListItem;
    // render 렌더링
    return(
        <div className="commcomment-list-item-topent-list-item">
            <div className="comment-list-item-top">
                <div className="comment-list-item-profile-box">
                    <div className="comment-list-item-profile-image" style={{backgroundImage:`url(${profileImage ? profileImage : defaultProfileImage})`}}></div>
                </div>
                <div className="comment-list-item-nickname">{nickname}</div>
                <div className="comment-list-item-divider">{'\|'}</div>
                <div className="comment-list-item-time">{writeDateTime}</div>
            </div>
            <div className="comment-list-item-main">
                <div className="comment-list-item-content">{content}</div>
            </div>
        </div>
    ) 
}
