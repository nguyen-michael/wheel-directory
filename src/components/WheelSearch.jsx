import React, { Component } from 'react';
import ResultsTable from './ResultsTable';

class WheelSearch extends Component {
    componentDidMount() {
        //  Gist of fetching data from API
        async function getWheels() {
            let response = await fetch(`/api/wheels`);
            let data = await response.json()
            return data;
            // data is a promise
        }
        getWheels().then(data => console.log(data)).catch(err => console.log(err));
    }

    render() {
        return (
            <div>
                <h1>
                    WHEEL SEARCH PAGE
                </h1>
                <ResultsTable />
            </div>
        );
    }
}

export default WheelSearch;