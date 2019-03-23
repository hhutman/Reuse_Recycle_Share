/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
import ReactOnRails from "react-on-rails";
import "babel-polyfill";
import Building from "../bundles/Building/Building.jsx";
import Goods from "../bundles/Goods";
import Search from "../bundles/Building/components/Search.jsx";

ReactOnRails.register({
  Search,
  Building,
  Goods,
});
