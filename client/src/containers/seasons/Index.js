import React, { Component } from 'react';
import SeasonIndex from '../../components/seasons/Index';

class Index extends Component {
  constructor(props) {
    super(props);
    this.state = {
      seasons: []
    };
  }

  componentDidMount() {
    let url = `http://localhost:3000/api/seasons`;
    window.fetch(url)
      .then(response => response.json())
      .then(json => {
        this.setState({
          seasons: json.seasons
        });
      })
      .catch(error => console.log(error));
  }

  render() {
    let seasons = this.state.seasons;
    return seasons ? <SeasonIndex seasons={seasons} /> : null;
  }
}

export default Index;
