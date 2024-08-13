import React from 'react'
import './style.css';
import defaultProfileImage from 'assets/images/default_avatar_profile.jpg';
import { BoardListItem } from 'types/interface';

interface Props{
    top3ListItem : BoardListItem;
}

export default function Top3Item({top3ListItem} : Props) {

    const {
        boardNumber
        ,title
        ,content
        ,boardTitleImage
        ,favoriteCount
        ,commentCount
        ,viewCount
        ,writeDateTime   
        ,writerNickname
        ,writerProfileImage} = top3ListItem;


    return (
        <div className='top-3-list-item' style={{backgroundImage: `url(${boardTitleImage})`}}>
            <div className='top-3-list-item-main-box'>
                <div className='top-3-list-item-top'>
                    <div className='top-3-list-item-profile-box'>
                        <div className='top-3-list-item-profile-image' style={{backgroundImage: `url(${writerProfileImage ? writerProfileImage : defaultProfileImage})`}}></div>
                    </div>            
                    <div className='top-3-list-item-write-box'>
                        <div className='top-3-list-item-nickname'>{writerNickname}</div>    
                        <div className='top-3-list-item-write-date'>{writeDateTime}</div>    
                    </div>            
                </div>
                <div className='top-3-list-item-middle'>
                    <div className='top-3-list-item-title'>{title}</div>
                    <div className='top-3-list-item-content'>{content}</div>
                </div>
                <div className='top-3-list-item-bottom'>
                    <div className='top-3-list-item-counts'>
                    {`댓글 ${commentCount} 좋아요 ${favoriteCount} 조회수 ${viewCount}`}
                    
                    </div>
                </div>
            </div>
        </div>
    )
}
