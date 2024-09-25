import React from "react";
import './style.css';
import { FavoriteListItem } from "types/interface";
import defaultProfileImage from 'assets/images/default_avatar_profile.jpg';

interface Props{
    favoriteListItem : FavoriteListItem; 
}

// component: Comment list item 컴포넌트
export default function FavoriteItem({favoriteListItem}: Props){

    const {nickname,profileImage} = favoriteListItem;

    // render 렌더링
    return(
        <div className="favorite-list-item">
            <div className="favorite-list-item-profile-box">
                <div className="favorite-list-item-profile-image" style={{backgroundImage:`url(${profileImage ? profileImage : defaultProfileImage})`}}></div>
            </div>
            <div className="favorite-list-item-nickname">{nickname}</div>
        </div>

    ) 
}
