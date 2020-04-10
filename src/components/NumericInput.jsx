import React, { Component } from 'react';

class NumericInput extends Component {
    render() {
        return (
            <form onSubmit={this.props.handleSubmit}>
                <label htmlFor={this.props.name}>
                    {this.props.label}
                    <input type="number" name={this.props.name} onChange={this.props.handleFormChange} value={this.props.value} min={this.props.min} max={this.props.max} step={this.props.step} />
                </label>
            </form>
        );
    }
}

export default NumericInput;