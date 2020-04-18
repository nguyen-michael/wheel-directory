import React, { Component } from 'react';
import RimSearchTable from './RimSearchTable';

class RimSearch extends Component {
    componentDidMount() {
        if (this.props.rimSearchData === "") {
            this.props.getDataFromApi("/api/rims", "RIMS_INITIAL");
        }
        if (this.props.rimSearchFacets === "") {
            this.props.getDataFromApi("/api/rim-facets", "RIMS_FACETS");
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