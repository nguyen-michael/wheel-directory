import React, { Component } from 'react';

class WheelSearchTable extends Component {
    render() {
        return (
            <table>
                <thead>
                    <tr>
                        <th>
                            Header :) Col 1
                        </th>
                        <th>
                            Other ones :) Col 2
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Col 1</td>
                        <td>Col 2</td>
                    </tr>
                    <tr>
                        <td>Col 1</td>
                        <td>Col 2</td>
                    </tr>
                </tbody>
            </table>
        );
    }
}

export default WheelSearchTable;