import React from "react";
import me from "../../assets/JUKI.jpg";
import "./header.css";

const Header = () => {
  return (
    <header id="home">
      <div className="container header__container">
        <h5>Hello, I'm</h5>
        <h1>LOKI</h1>
        <h5 className="text-light">Software Engineering Undergraduate</h5>
        {/* <CTA /> */}
        {/* <HeaderSocials /> */}

        <div className="me">
          <img src={me} alt="me" />
        </div>

        <a href="#contacts" className="scroll__down">
          Scroll Down
        </a>
      </div>
    </header>
  );
};

export default Header;
