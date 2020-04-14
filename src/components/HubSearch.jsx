import React, { Component } from 'react';

class HubSearch extends Component {
    componentDidMount() {
        this.props.getDataFromApi("/api/hubs", "HUBS_INITIAL");
    }

    render() {
        return (
            <h1>
                HUB SEARCH
            </h1>
        );
    }
}

export default HubSearch;