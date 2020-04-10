import React, { Component } from 'react';

// Can take in info and titles etc to generate a nice selector
class Selector extends Component {
    render() {
        const options = this.props.options.map(number => {
            return (<option value={number} key={number}>{number}</option>);
        });
        return (
            <div>
                <label htmlFor={this.props.name}>
                    {this.props.name}
                    <select name={this.props.name} id={this.props.name} value={this.props.spokeCalcHoleCount} onChange={this.props.handleFormChange}>
                        {options}
                    </select>
                </label>
            </div>
        );
    }
}

export default Selector;