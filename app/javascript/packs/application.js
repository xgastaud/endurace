import "bootstrap";
import "../components/background_video";
import "../plugins/flatpickr";
import "../components/filter";
import {changeTabs} from "../components/tabs";
import { toggleClass } from "../components/searchbar";
toggleClass();

changeTabs();
import {niceDropdown} from "../components/selectric";
niceDropdown();
import {loadDynamicBannerText} from "../components/under_title";
loadDynamicBannerText();
import { addToMyWishList } from '../components/wishlist';
addToMyWishList();
