import React, { Component } from 'react';
import HubSearchTable from './HubSearchTable';

class HubSearch extends Component {
    componentDidMount() {
        if (this.props.hubSearchData === "") {
            this.props.getDataFromApi("/api/hubs", "HUBS_INITIAL");
        }
    }

    render() {
        return (
            <div>
                <h1>
                    HUB SEARCH
                </h1>
                <HubSearchTable hubSearchData={this.props.hubSearchData} />
            </div>
        );
    }
}

export default HubSearch;