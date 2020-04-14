import React, { Component } from 'react';

class RimSearch extends Component {
    componentDidMount() {
        this.props.getDataFromApi("/api/rims", "RIMS_INITIAL");
    }

    render() {
        return (
            <h1>
                RIMS SEARCH
            </h1>
        );
    }
}

export default RimSearch;