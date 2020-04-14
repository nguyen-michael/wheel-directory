import React, { Component } from 'react';

class HubSearchTable extends Component {
    constructor(props) {
        super(props);

        this.state = {
            fields: [
                { title: "Manufacturer", dbName: "manufacturer" },
                { title: "Model", dbName: "model_name" },
                { title: "Side", dbName: "side" },
                { title: "Hole Count", dbName: "hole_count" },
                { title: "Spoke Type", dbName: "spoke_interface" },
                { title: "Driver", dbName: "driver" },
                { title: "Brake", dbName: "brake" },
                { title: "Boost?", dbName: "boost" },
                { title: "Weight", dbName: "weight" },
                { title: "Notes", dbName: "notes" }
            ]
        }
    }

    render() {
        let tableContent;
        if (this.props.hubSearchData === "") {
            tableContent = <p>
                Loading...
            </p>;
        } else if (this.props.hubSearchData.length === 0) {
            tableContent = <p>
                No Data Found
            </p>;
        } else {
            const tableRows = this.props.hubSearchData.map((row, index) => {
                // Destructure the object
                const { manufacturer, model_name, side, hole_count, spoke_interface, driver, brake, boost, weight, notes } = row;

                return (
                    <tr key={index}>
                        <td>{manufacturer}</td>
                        <td>{model_name}</td>
                        <td>{side}</td>
                        <td>{hole_count}</td>
                        <td>{spoke_interface}</td>
                        <td>{driver}</td>
                        <td>{brake}</td>
                        <td>{boost}</td>
                        <td>{weight}</td>
                        <td>{notes}</td>
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

export default HubSearchTable;