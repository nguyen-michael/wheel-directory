import React, { Component } from 'react';
import Selector from './Selector';
import NumericInput from './NumericInput';

class SpokeCalculator extends Component {
    render() {
        const possibleHoleCounts = [8, 12, 16, 18, 20, 24, 28, 32, 36, 40, 48, 72, 144];
        return (
            <div>
                This is the SpokeCalculator Yay!
                <NumericInput handleFormChange={this.props.handleFormChange} name="spokeCalcFlangePcdNds" label="Non Drive Side Flange PCD" value={this.props.spokeCalcFlangePcdNds} min="1" />
                <NumericInput handleFormChange={this.props.handleFormChange} name="spokeCalcFlangePcdDs" label="Drive Side Flange PCD" value={this.props.spokeCalcFlangePcdDs} min="1" />
                <NumericInput handleFormChange={this.props.handleFormChange} name="spokeCalcCenterToLeft" label="Center to Left Flange" value={this.props.spokeCalcCenterToLeft} min="1" />
                <NumericInput handleFormChange={this.props.handleFormChange} name="spokeCalcCenterToRight" label="Center to Right Flange " value={this.props.spokeCalcCenterToRight} min="1" />
                <NumericInput handleFormChange={this.props.handleFormChange} name="spokeCalcSpokeHoleDiameter" label="Spoke Hole Diameter" value={this.props.spokeCalcSpokeHoleDiameter} min="1" step="0.1" />
                <NumericInput handleFormChange={this.props.handleFormChange} name="spokeCalcERD" label="ERD" value={this.props.spokeCalcERD} min="1" />
                <NumericInput handleFormChange={this.props.handleFormChange} name="spokeCalcOffsetSpokeBed" label="Offset Spoke Bed" value={this.props.spokeCalcOffsetSpokeBed} min="0" step="0.1"/>
                <Selector
                    handleFormChange={this.props.handleFormChange}
                    name="spokeCalcHoleCount"
                    label="Hole Count"
                    options={possibleHoleCounts}
                    value={this.props.spokeCalcHoleCount}
                />
                <form>
                    <label>Offset Direction</label>
                    <input
                        type="radio"
                        name="spokeCalcOffsetDirection"
                        value="nds"
                        checked={this.props.spokeCalcOffsetDirection === "nds"}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcOffsetDirection">To Non Drive Side</label>
                    <input
                        type="radio"
                        name="spokeCalcOffsetDirection"
                        value="ds"
                        checked={this.props.spokeCalcOffsetDirection === "ds"}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcOffsetDirection">To Drive Side</label>
                </form>
                <form>
                    <label>Cross Pattern Non Drive Side</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternNds"
                        value="0"
                        checked={this.props.spokeCalcCrossPatternNds === "0"}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternNds">0</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternNds"
                        value="1"
                        checked={this.props.spokeCalcCrossPatternNds === "1"}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternNds">1</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternNds"
                        value="2"
                        checked={this.props.spokeCalcCrossPatternNds === "2"}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternNds">2</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternNds"
                        value="3"
                        checked={this.props.spokeCalcCrossPatternNds === "3"}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternNds">3</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternNds"
                        value="4"
                        checked={this.props.spokeCalcCrossPatternNds === "4"}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternNds">4</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternNds"
                        value="5"
                        checked={this.props.spokeCalcCrossPatternNds === "5"}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternNds">5</label>
                </form>
                <form>
                    <label>Cross Pattern Drive Side</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternDs"
                        value="0"
                        checked={this.props.spokeCalcCrossPatternDs === "0"}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternDs">0</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternDs"
                        value="1"
                        checked={this.props.spokeCalcCrossPatternDs === "1"}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternDs">1</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternDs"
                        value="2"
                        checked={this.props.spokeCalcCrossPatternDs === "2"}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternDs">2</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternDs"
                        value="3"
                        checked={this.props.spokeCalcCrossPatternDs === "3"}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternDs">3</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternDs"
                        value="4"
                        checked={this.props.spokeCalcCrossPatternDs === "4"}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternDs">4</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternDs"
                        value="5"
                        checked={this.props.spokeCalcCrossPatternDs === "5"}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternDs">5</label>
                </form>
                <button onClick={this.props.updateSpokeCalculation}>Calculate!</button>
                <div>
                    RESULTS: Non Drive Side: {Math.round(this.props.spokeCalcNdsCalculation * 100) / 100} , Drive Side: {Math.round(this.props.spokeCalcDsCalculation * 100) / 100}
                </div>
            </div>
        );
    }
}

export default SpokeCalculator;