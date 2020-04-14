import React, { Component } from 'react';
import WheelSearchTable from './WheelSearchTable';

class WheelSearch extends Component {
    componentDidMount() {
        // Do not fetch initial data if we already have any data:
        if (this.props.wheelSearchData === "") {
            this.props.getDataFromApi("/api/wheels", "WHEELS_INITIAL");
        }
    }

    render() {
        return (
            <div>
                <h1>
                    WHEEL SEARCH PAGE
                </h1>
                <WheelSearchTable wheelSearchData={this.props.wheelSearchData} />
            </div>
        );
    }
}

export default WheelSearch;