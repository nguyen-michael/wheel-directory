import React, { Component } from 'react';

class ResultsTable extends Component {
    constructor(props) {
        super(props);

        this.state = {
            fields: [
                { title: "Manufacturer", dbName: "manufacturer" },
                { title: "Model", dbName: "model_name" },
                { title: "Hole Count", dbName: "hole_count" },
                { title: "Tire Type", dbName: "tire_type" },
                { title: "Inner Width", dbName: "inner_width" },
                { title: "Depth", dbName: "depth" },
                { title: "Rim Brake?", dbName: "rim_brake" },
                { title: "Material", dbName: "material" },
                { title: "Weight", dbName: "weight" },
                { title: "Notes", dbName: "notes" }
            ]
        }
    }

    render() {
        let tableContent;
        if (this.props.rimSearchData === "") {
            tableContent = <p>
                Loading...
            </p>;
        } else if (this.props.rimSearchData.length === 0) {
            tableContent = <p>
                No Data Found
            </p>;
        } else {
            const tableRows = this.props.rimSearchData.map((row, index) => {
                // Destructure the object
                const { manufacturer, model_name, hole_count, tire_type, inner_width, depth, rim_brake, material, weight, notes } = row;

                return (
                    <tr key={index}>
                        <td>{manufacturer}</td>
                        <td>{model_name}</td>
                        <td>{hole_count}</td>
                        <td>{tire_type}</td>
                        <td>{inner_width}</td>
                        <td>{depth}</td>
                        <td>{rim_brake}</td>
                        <td>{material}</td>
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

export default ResultsTable;