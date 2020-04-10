import React, { Component } from 'react';
import SpokeCalculator from './components/SpokeCalculator';
import spokeCalc from './spokeCalc';

class App extends Component {
    constructor(props) {
        super(props)
        this.state = {
            spokeCalcHoleCount: "32",
            spokeCalcCrossPatternNds: "3",
            spokeCalcCrossPatternDs: "3",
            spokeCalcFlangePcdNds: "",
            spokeCalcFlangePcdDs: "",
            spokeCalcCenterToLeft: "",
            spokeCalcCenterToRight: "",
            spokeCalcSpokeHoleDiameter: "2.6",
            spokeCalcERD: "",
            spokeCalcOffsetSpokeBed: "0",
            spokeCalcOffsetDirection: "nds",
            spokeCalcNdsCalculation: "",
            spokeCalcDsCalculation: this.updateSpokeCalculation()
        }

        this.handleFormChange = this.handleFormChange.bind(this);
        this.updateSpokeCalculation = this.updateSpokeCalculation.bind(this);
    }

/*     componentDidUpdate(prevProps, prevState) {
        // Update Spoke Calculation 
        // Will need to factor in offset
        // Cureently causes infinite loop. Figure out a place to update the state for spoke calculation

        // This will not work because objects are references
        const stateChanged = this.state !== prevState;

        if (
            this.state.spokeCalcFlangePcdNds > 0
            && this.state.spokeCalcCenterToLeft > 0
            && this.state.spokeCalcSpokeHoleDiameter > 0
            && this.state.spokeCalcERD > 0
            && this.state.spokeCalcOffsetSpokeBed >= 0
        ) {
            this.setState({
                spokeCalcNdsCalculation: spokeCalc(this.state.spokeCalcERD, this.state.spokeCalcFlangePcdNds, this.state.spokeCalcCenterToLeft, this.state.spokeCalcCrossPatternNds, this.state.spokeCalcHoleCount, this.state.spokeCalcSpokeHoleDiameter)
            });
        }

        if (
            this.state.spokeCalcFlangePcdDs > 0
            && this.state.spokeCalcCenterToRight > 0
            && this.state.spokeCalcSpokeHoleDiameter > 0
            && this.state.spokeCalcERD > 0
            && this.state.spokeCalcOffsetSpokeBed >= 0
        ) {
            this.setState({
                spokeCalcNdsCalculation: spokeCalc(this.state.spokeCalcERD, this.state.spokeCalcFlangePcdDs, this.state.spokeCalcCenterToRight, this.state.spokeCalcCrossPatternDs, this.state.spokeCalcHoleCount, this.state.spokeCalcSpokeHoleDiameter)
            });
        }
    } */

    updateSpokeCalculation() {
        return spokeCalc(600, 50, 35, this.state.spokeCalcCrossPatternNds, 28, 2.6)
    }

    handleFormChange(e) {
        /*         if (e.target.type === "checkbox" || e.target.type === "radio") {
                    console.log("Form Changed!", e.target.name, e.target.value, e.target.checked);
                } else {
                    console.log("Form Changed!", e.target.name, e.target.value, e.target);
                }
        
                Testing for now
                if (e.target.type === "select-one") {
                    this.setState({ 
                        [e.target.name]: e.target.value 
                    });
                }
        
                if (e.target.type === "radio") {
                    this.setState({
                        [e.target.name]: e.target.value
                    });
                } */

        this.setState({
            [e.target.name]: e.target.value
        });

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
