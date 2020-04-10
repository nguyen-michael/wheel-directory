import React, { Component } from 'react';

class OffsetSwitch extends Component {
    render() {
        return (
            <form>
                <label htmlFor=""></label>
                <input type="checkbox" name="" onChange={this.props.handleFormChange} />
            </form>
        );
    }
}

export default OffsetSwitch;