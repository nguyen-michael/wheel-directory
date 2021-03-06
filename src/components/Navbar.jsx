import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class Navbar extends Component {
    render() {
        return (
            <div>
                <Link to="/">Home</Link>
                <Link to="/wheels">Wheel Search</Link>            
                <Link to="/rims">Rims</Link>
                <Link to="/hubs">Hubs</Link>
                <Link to="/calculator">Calculator</Link>
            </div>
        );
    }
}

export default Navbar;