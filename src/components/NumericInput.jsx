import React, { Component } from 'react';

class NumericInput extends Component {
    render() {
        return (
            <form>
                <label htmlFor={this.props.name}>
                    {this.props.label}
                    <input type="number" name={this.props.name} onChange={this.props.handleFormChange} value={this.props.value}/>
                </label>
            </form>
        );
    }
}

export default NumericInput;