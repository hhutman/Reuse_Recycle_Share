import React from 'react';
import { Portal } from "react-portal";
import Form from '../Form';


const Modal = ({ toggleModal, isOpen, createItem, type }) => (
  isOpen && (
    <Portal>
      <aside className="c-modal-cover fadeIn">
        <div className="c-modal slideIn">
          <div className="c-modal__body">
            <Form toggleModal={toggleModal} type={type} createItem={createItem} />
          </div>
        </div>
      </aside>
  </Portal>
  )
)

export default Modal;
