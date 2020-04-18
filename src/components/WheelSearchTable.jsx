import React, { Component } from 'react';
import spokeCalc from "../spokeCalc";

class WheelSearchTable extends Component {
    constructor(props) {
        super(props);

        this.state = {
            // do/will we need DB name?
            fields: [
                { title: "Rim", dbName: "rim" },
                { title: "Hub", dbName: "hub" },
                { title: "Side", dbName: "side" },
                { title: "Size", dbName: "iso_diameter"},
                { title: "Cross (Non Drive)", dbName: "cross_pattern_nds" },
                { title: "Cross (Drive)", dbName: "cross_pattern_ds" },
                { title: "Spoke Length (Non Drive)", dbName: "spoke_length_nds" },
                { title: "Spoke Length (Drive)", dbName: "spoke_length_ds" }
            ]
        }
    }

    render() {
        let tableContent;
        if (this.props.wheelSearchData === "") {
            tableContent = <p>
                Loading...
            </p>;
        } else if (this.props.wheelSearchData.length === 0) {
            tableContent = <p>
                No Data Found
            </p>;
        } else {
            const tableRows = this.props.wheelSearchData.map((row, index) => {
                // Destructure the object
                const { rim, hub, side, iso_diameter, cross_pattern_nds, cross_pattern_ds, spoke_length_nds, spoke_length_ds, erd, offset_spoke_bed, hole_count, center_to_left, center_to_right, flange_pcd_nds, flange_pcd_ds, spoke_hole_diameter } = row;

                // Auto-calculating the spoke lengths
                // Temp: Automatically setting the offset to equalize hub spacing. defaults to nds if hub is even.
                let adjusted_ctl;
                let adjusted_ctr;
                if (center_to_left >= center_to_right) {
                    adjusted_ctl = center_to_left - offset_spoke_bed;
                    adjusted_ctr = center_to_right + offset_spoke_bed;
                } else {
                    adjusted_ctl = center_to_left + offset_spoke_bed;
                    adjusted_ctr = center_to_right - offset_spoke_bed;
                }
                
                //We can set hovers for auto or set lengths later
                const displayedSpokeLengthNds = spoke_length_nds ? spoke_length_nds : Math.round(spokeCalc(erd, flange_pcd_nds, adjusted_ctl, cross_pattern_nds, hole_count, spoke_hole_diameter) * 100) / 100;
                const displayedSpokeLengthDs = spoke_length_ds ? spoke_length_ds : Math.round(spokeCalc(erd, flange_pcd_ds, adjusted_ctr, cross_pattern_ds, hole_count, spoke_hole_diameter) * 100) / 100;
                return (
                    <tr key={index}>
                        <td>{rim}</td>
                        <td>{hub}</td>
                        <td>{side}</td>
                        <td>{iso_diameter}</td>
                        <td>{cross_pattern_nds}</td>
                        <td>{cross_pattern_ds}</td>
                        <td>{displayedSpokeLengthNds}</td>
                        <td>{displayedSpokeLengthDs}</td>
                    </tr>
                );
            });

            tableContent = (
                <table>
                    <thead>
                        <tr>
                            {this.state.fields.map((item, index) => <th key={index}>{item.title}</th>)}
                        </tr>
                    </thead>
                    <tbody>
                        {tableRows}
                    </tbody>
                </table>
            );
        }

        return tableContent;
    }
}

export default WheelSearchTable;