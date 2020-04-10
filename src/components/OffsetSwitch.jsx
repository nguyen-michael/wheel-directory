import React, { Component } from 'react';

class OffsetSwitch extends Component {
    render() {
        return (
            <div>
                <input type="checkbox" name="offset left or right" onChange={this.props.handleFormChange} />
            </div>
        );
    }
}

export default OffsetSwitch;