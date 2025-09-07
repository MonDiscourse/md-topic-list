import { apiInitializer } from "discourse/lib/api";
import icon from "discourse/helpers/d-icon";

export default apiInitializer((api) => {
  api.renderInOutlet("topic-list-before-category", <template>
    <span class="topic-creator">{{icon "user"}} <a href="/u/{{@topic.creator.username}}" data-auto-route="true" data-user-card="{{@topic.creator.username}}">{{@topic.creator.username}}</a></span>
  </template>);
});