import React, { Component } from 'react';
import SpokeCalculator from './components/SpokeCalculator';
import spokeCalc from './spokeCalc';

class App extends Component {
    constructor(props) {
        super(props)
        this.state = {
            spokeCalcHoleCount: 32,
            spokeCalcCrossPatternNds: 3,
            spokeCalcCrossPatternDs: 3
        }

        this.handleFormChange = this.handleFormChange.bind(this);
    }

    handleFormChange(e) {
        if (e.target.type === "checkbox" || e.target.type === "radio") {
            console.log("Form Changed!", e.target.name, e.target.value, e.target.checked);
        } else {
            console.log("Form Changed!", e.target.name, e.target.value, e.target);
        }

        // Testing for now
        if (e.target.name === "Hole Count") {
            this.setState({ spokeCalcHoleCount: e.target.value });
        }

        if (e.target.type === "radio") {
            this.setState({
                [e.target.name]: parseInt(e.target.value, 10)
            });
        }

    }
    render() {
        return (
            <div className="App">
                IMAGINARY NAVBAR :D
                <SpokeCalculator handleFormChange={this.handleFormChange} {...this.state} />
            </div>
        );
    }
}

export default App;
