import React from "react";
import About from "./components/about/About.jsx";
import Contacts from "./components/contacts/Contacts.jsx";
import Experience from "./components/experience/Experience.jsx";
import Footer from "./components/footer/Footer.jsx";
import Header from "./components/header/Header.jsx";
import Myprojects from "./components/myprojects/Myprojects.jsx";
import Nav from "./components/nav/Nav.jsx";

const App = () => {
  return (
    <>
      <Header />
      <Nav />
      <About />
      <Experience />
      <Myprojects />
      <Contacts />
      <Footer />
    </>
  );
};

export default App;
