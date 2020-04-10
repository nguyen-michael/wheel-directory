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
            spokeCalcDsCalculation: ""
        }

        this.handleFormChange = this.handleFormChange.bind(this);
        this.updateSpokeCalculation = this.updateSpokeCalculation.bind(this);
    }

    // This functions but it  seems to be "off" by a cycle and doesn't quite update on the spot. Maybe have a submit button, also prevent default on enter.
    updateSpokeCalculation() {
        if (
            this.state.spokeCalcFlangePcdNds > 0
            && this.state.spokeCalcCenterToLeft > 0
            && this.state.spokeCalcSpokeHoleDiameter > 0
            && this.state.spokeCalcERD > 0
            && this.state.spokeCalcOffsetSpokeBed >= 0
        ) {
            this.setState((state) => {
                return {spokeCalcNdsCalculation: spokeCalc(state.spokeCalcERD, state.spokeCalcFlangePcdNds, state.spokeCalcCenterToLeft, state.spokeCalcCrossPatternNds, state.spokeCalcHoleCount, state.spokeCalcSpokeHoleDiameter)}
            });
        }

        if (
            this.state.spokeCalcFlangePcdDs > 0
            && this.state.spokeCalcCenterToRight > 0
            && this.state.spokeCalcSpokeHoleDiameter > 0
            && this.state.spokeCalcERD > 0
            && this.state.spokeCalcOffsetSpokeBed >= 0
        ) {
            this.setState((state) => {
                return {spokeCalcDsCalculation: spokeCalc(state.spokeCalcERD, state.spokeCalcFlangePcdDs, state.spokeCalcCenterToRight, state.spokeCalcCrossPatternDs, state.spokeCalcHoleCount, state.spokeCalcSpokeHoleDiameter)}
            });
        }
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

        // Update the spoke calculations if a SpokeCalculator child was changed
        if (e.target.name.includes("spokeCalc")) {
            this.updateSpokeCalculation();
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
