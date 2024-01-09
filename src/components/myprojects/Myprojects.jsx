import React from "react";
import IMG3 from "../../assets/EM-Lab-Certificate.webp";
import IMG4 from "../../assets/IYTA-Certificate.webp";
import IMG2 from "../../assets/Julius_Cert.webp";
import "./myprojects.css";

const Myprojects = () => {
  return (
    <section id="myprojects">
      <h5>My Recent Certificates</h5>
      <h2>Certificates</h2>

      <div className="container portfolio__container">
        <article className="portfolio__item">
          <div className="portfolio__item-image">
            <img src={IMG2} alt="" />
          </div>
          <h3>Certificate 1</h3>
          <small className="text-light">Certificado</small>
        </article>
        <article className="portfolio__item">
          <div className="portfolio__item-image">
            <img src={IMG4} alt="" />
          </div>
          <h3>Certificate 2</h3>
          <small className="text-light">Certificate of attendance</small>
        </article>
        <article className="portfolio__item">
          <div className="portfolio__item-image">
            <img src={IMG3} alt="" />
          </div>
          <h3>Certificate 3</h3>
          <small className="text-light">Completion</small>
        </article>
      </div>
    </section>
  );
};

export default Myprojects;
