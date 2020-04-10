import React, { Component } from 'react';
import Selector from './Selector';
import NumericInput from './NumericInput';
import OffsetSwitch from './OffsetSwitch';

class SpokeCalculator extends Component {
    constructor(props) {
        super(props);

        this.state = {
            possible_hole_counts: [8, 12, 16, 18, 20, 24, 28, 32, 36, 40, 48, 72, 144]
        }
    }

    render() {
        return (
            <div>
                This is the SpokeCalculator Yay!
                <NumericInput handleFormChange={this.props.handleFormChange} name="flange pcd nds" />
                <NumericInput handleFormChange={this.props.handleFormChange} name="flange pcd ds" />
                <NumericInput handleFormChange={this.props.handleFormChange} name="CTL" />
                <NumericInput handleFormChange={this.props.handleFormChange} name="CTR" />
                <NumericInput handleFormChange={this.props.handleFormChange} name="spoke hole diameter" />
                <NumericInput handleFormChange={this.props.handleFormChange} name="ERD" />
                <NumericInput handleFormChange={this.props.handleFormChange} name="offset spoke bed" />
                <OffsetSwitch handleFormChange={this.props.handleFormChange} />
                <Selector
                    handleFormChange={this.props.handleFormChange}
                    name="Hole Count"
                    options={this.state.possible_hole_counts}
                    spokeCalcHoleCount={this.props.spokeCalcHoleCount}
                />
                <form>
                    <label>Cross Pattern Non Drive Side</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternNds"
                        value="0"
                        checked={this.props.spokeCalcCrossPatternNds === 0}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternNds">0</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternNds"
                        value="1"
                        checked={this.props.spokeCalcCrossPatternNds === 1}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternNds">1</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternNds"
                        value="2"
                        checked={this.props.spokeCalcCrossPatternNds === 2}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternNds">2</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternNds"
                        value="3"
                        checked={this.props.spokeCalcCrossPatternNds === 3}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternNds">3</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternNds"
                        value="4"
                        checked={this.props.spokeCalcCrossPatternNds === 4}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternNds">4</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternNds"
                        value="5"
                        checked={this.props.spokeCalcCrossPatternNds === 5}
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
                        checked={this.props.spokeCalcCrossPatternDs === 0}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternDs">0</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternDs"
                        value="1"
                        checked={this.props.spokeCalcCrossPatternDs === 1}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternDs">1</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternDs"
                        value="2"
                        checked={this.props.spokeCalcCrossPatternDs === 2}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternDs">2</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternDs"
                        value="3"
                        checked={this.props.spokeCalcCrossPatternDs === 3}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternDs">3</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternDs"
                        value="4"
                        checked={this.props.spokeCalcCrossPatternDs === 4}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternDs">4</label>
                    <input
                        type="radio"
                        name="spokeCalcCrossPatternDs"
                        value="5"
                        checked={this.props.spokeCalcCrossPatternDs === 5}
                        onChange={this.props.handleFormChange}
                    />
                    <label htmlFor="spokeCalcCrossPatternDs">5</label>
                </form>
            </div>
        );
    }
}

export default SpokeCalculator;