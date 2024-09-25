import React from 'react';
import './App.css';
import BoardItem from 'components/BoardItem';
import { latestBoardListMock , top3BoardListMock, commentListMock, favoriteListMock} from 'mocks';
import Top3Item from 'components/Top3Item';
import CommentItem from 'components/CommentItem';
import FavoriteItem from 'components/FavoriteItem';

function App() {
  return (
    <>
      <div style={{display: 'flex', rowGap: '20px', columnGap: '30px'}}>
        {favoriteListMock.map(favoriteListItem => <FavoriteItem favoriteListItem={favoriteListItem}/>)}
      </div>      
    </>
  );
}

export default App;
