import React, { Component } from 'react';
import GamesIndex from '../../components/games/Index';

class Index extends Component {
  constructor(props) {
    super(props);
    this.state = {
      season: undefined,
      games: []
    }
  }

  componentDidMount() {
    let seasonId = this.props.location.state.seasonId;
    window.fetch(`api/games?seasonId=${seasonId}`)
      .then(response => response.json())
      .then(json => {
        this.setState({
          season: json.season,
          games: json.games
        });
      })
      .catch(error => console.log(error))
  }

  render() {
    let season = this.state.season;
    let games = this.state.games;
    return season ? <GamesIndex season={season} games={games} /> : null;
  }
}

export default Index;