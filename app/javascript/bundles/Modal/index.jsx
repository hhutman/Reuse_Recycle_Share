import React from 'react';
import { Portal } from "react-portal";
import Form from '../Form';


const Modal = ({ toggleModal, isOpen, createItem, type }) => (
  isOpen ? (
    <Portal>
      {console.log(isOpen)}
      <aside className="c-modal-cover fadeIn">
        <div className="c-modal slideIn">
          <div className="c-modal__body">
            <Form toggleModal={toggleModal} type={type} createItem={createItem} />
          </div>
        </div>
      </aside>
  </Portal>
) : null
)

export default Modal;
