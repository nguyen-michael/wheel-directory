import React, { Component } from 'react';
import WheelSearchTable from './WheelSearchTable';

class WheelSearch extends Component {
    // constructor(props) {
    //     super(props);
        
    //     this.state = {

    //     }
    // }
    
    componentDidMount() {
        this.props.getDataFromApi("/api/wheels");
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