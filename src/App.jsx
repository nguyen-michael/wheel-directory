import React, { Component } from 'react';
import { Route, Switch } from 'react-router-dom';
import NotFound from './components/NotFound';
import Navbar from './components/Navbar';
import SpokeCalculator from './components/SpokeCalculator';
import spokeCalc from './spokeCalc';
import WheelSearch from './components/WheelSearch';
import RimSearch from './components/RimSearch';
import HubSearch from './components/HubSearch';

class App extends Component {
    constructor(props) {
        super(props)
        this.state = {
            spokeCalcHoleCount: "32",
            spokeCalcCrossPatternNds: "3",
            spokeCalcCrossPatternDs: "3",
            spokeCalcFlangePcdNds: "58",
            spokeCalcFlangePcdDs: "58",
            spokeCalcCenterToLeft: "34",
            spokeCalcCenterToRight: "18",
            spokeCalcSpokeHoleDiameter: "2.6",
            spokeCalcERD: "606",
            spokeCalcOffsetSpokeBed: "0",
            spokeCalcOffsetDirection: "nds",
            spokeCalcNdsCalculation: spokeCalc(606, 58, 34, 3, 32, 2.6),
            spokeCalcDsCalculation: spokeCalc(606, 58, 18, 3, 32, 2.6),
            wheelSearchData: "",
            wheelSearchFields: "",
            rimSearchData: "",
            hubSearchData: "",
            rimSearchFacets: "",
            hubSearchFacets: ""
        }

        this.handleFormChange = this.handleFormChange.bind(this);
        this.updateSpokeCalculation = this.updateSpokeCalculation.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
        this.getDataFromApi = this.getDataFromApi.bind(this);
    }

    updateSpokeCalculation() {
        if (
            this.state.spokeCalcFlangePcdNds > 0
            && this.state.spokeCalcCenterToLeft > 0
            && this.state.spokeCalcSpokeHoleDiameter > 0
            && this.state.spokeCalcERD > 0
            && this.state.spokeCalcOffsetSpokeBed >= 0
        ) {
            if (this.state.spokeCalcOffsetDirection === "nds") {
                this.setState((state) => {
                    return { spokeCalcNdsCalculation: spokeCalc(state.spokeCalcERD, state.spokeCalcFlangePcdNds, parseFloat(state.spokeCalcCenterToLeft) - parseFloat(state.spokeCalcOffsetSpokeBed), state.spokeCalcCrossPatternNds, state.spokeCalcHoleCount, state.spokeCalcSpokeHoleDiameter) }
                });
            } else if (this.state.spokeCalcOffsetDirection === "ds") {
                this.setState((state) => {
                    return { spokeCalcNdsCalculation: spokeCalc(state.spokeCalcERD, state.spokeCalcFlangePcdNds, parseFloat(state.spokeCalcCenterToLeft) + parseFloat(state.spokeCalcOffsetSpokeBed), state.spokeCalcCrossPatternNds, state.spokeCalcHoleCount, state.spokeCalcSpokeHoleDiameter) }
                });
            }
        }

        if (
            this.state.spokeCalcFlangePcdDs > 0
            && this.state.spokeCalcCenterToRight > 0
            && this.state.spokeCalcSpokeHoleDiameter > 0
            && this.state.spokeCalcERD > 0
            && this.state.spokeCalcOffsetSpokeBed >= 0
        ) {
            if (this.state.spokeCalcOffsetDirection === "nds") {
                this.setState((state) => {
                    return { spokeCalcDsCalculation: spokeCalc(state.spokeCalcERD, state.spokeCalcFlangePcdDs, parseFloat(state.spokeCalcCenterToRight) + parseFloat(state.spokeCalcOffsetSpokeBed), state.spokeCalcCrossPatternDs, state.spokeCalcHoleCount, state.spokeCalcSpokeHoleDiameter) }
                });
            } else if (this.state.spokeCalcOffsetDirection === "ds") {
                this.setState((state) => {
                    return { spokeCalcDsCalculation: spokeCalc(state.spokeCalcERD, state.spokeCalcFlangePcdDs, parseFloat(state.spokeCalcCenterToRight) - parseFloat(state.spokeCalcOffsetSpokeBed), state.spokeCalcCrossPatternDs, state.spokeCalcHoleCount, state.spokeCalcSpokeHoleDiameter) }
                });
            }
        }
    }

    handleFormChange(e) {
        /*
            Check e.target.type
        */
        this.setState({
            [e.target.name]: e.target.value
        });
    }

    handleSubmit(e) {
        e.preventDefault();
    }

    getDataFromApi(route, name) {
        async function fetchData() {
            let response = await fetch(route);
            let data = await response.json()
            return data;
            // data is a promise
            // Errors are handled in the catch below.
        }
        // Will set up switch here to handle what to do from different pages
        switch (name) {
            case "WHEELS_INITIAL":
                fetchData()
                    .then(data => {
                        console.log(name, data);
                        // Use only name string
                        // const fields = data.fields.map(field => field.name);
                        this.setState({
                            wheelSearchData: data.rows
                            // wheelSearchFields: fields
                        });
                    })
                    .catch(err => console.log(err));
                break;
            case "RIMS_INITIAL":
                fetchData()
                    .then(data => {
                        console.log(name, data);
                        this.setState({
                            rimSearchData: data.rows
                        });
                    })
                    .catch(err => console.log(err));
                break;
            case "HUBS_INITIAL":
                fetchData()
                    .then(data => {
                        console.log(name, data);
                        this.setState({
                            hubSearchData: data.rows
                        });
                    })
                    .catch(err => console.log(err));
                break;
            case "RIMS_FACETS":
                fetchData()
                    .then(data => {
                        console.log(name, data);
                        this.setState({
                            rimSearchFacets: data.rows
                        });
                    })
                    .catch(err => console.log(err));
                break;
            default:
                console.log("Error: No data Api name provided.")
                break;
        }

    }

    render() {
        return (
            <div className="App">
                <Navbar />
                <Switch>
                    <Route path="/" exact render={() => <h1>Imaginary Home Page</h1>} />
                    <Route path="/calculator" render={() => <SpokeCalculator {...this.state} handleFormChange={this.handleFormChange} updateSpokeCalculation={this.updateSpokeCalculation} handleSubmit={this.handleSubmit} />} />
                    <Route path="/wheels" render={() => <WheelSearch {...this.state} getDataFromApi={this.getDataFromApi} />} />
                    <Route path="/rims" render={() => <RimSearch {...this.state} getDataFromApi={this.getDataFromApi} />} />
                    <Route path="/hubs" render={() => <HubSearch {...this.state} getDataFromApi={this.getDataFromApi} />} />
                    <Route component={NotFound} />
                </ Switch>
            </div>
        );
    }
}

export default App;
