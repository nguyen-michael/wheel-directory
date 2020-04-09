import React, { Component } from 'react';
import Selector from './Selector';
import NumericInput from './NumericInput';

class SpokeCalculator extends Component {
    render() {
        return (
            <div>
                This is the SpokeCalculator Yay!
                <Selector />
                <Selector />
                <Selector />
                <NumericInput />
                <NumericInput />
                <NumericInput />
                <NumericInput />
                result here : ____ _____
            </div>
        );
    }
}

export default SpokeCalculator;