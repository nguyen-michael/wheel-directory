import React, { Component } from 'react';
import RimSearchTable from './RimSearchTable';

class RimSearch extends Component {
    componentDidMount() {
        if (this.props.rimSearchData === "") {
            this.props.getDataFromApi("/api/rims", "RIMS_INITIAL");
        }
    }

    render() {
        return (
            <div>
                <h1>
                    RIMS SEARCH
                </h1>
                <RimSearchTable rimSearchData={this.props.rimSearchData} />
            </div>
        );
    }
}

export default RimSearch;