import Component from "@glimmer/component";
import { service } from "@ember/service";
import avatar from "discourse/helpers/avatar";
import formatDate from "discourse/helpers/format-date";

export default class LastPostContent extends Component {
  @service site;

  get topic() {
    return this.args.topic || this.args.outletArgs?.topic;
  }

  <template>
    <td class="last-post">
      <div class="poster-avatar">
        <a
          href={{@topic.lastPostUrl}}
          data-user-card={{@topic.last_poster_username}}
        >{{avatar @topic.lastPosterUser imageSize="medium"}}</a>
      </div>
      <div class="poster-info">
        <span class="editor"><a
            href="/u/{{@topic.last_poster_username}}"
            data-auto-route="true"
            data-user-card={{@topic.last_poster_username}}
          >{{@topic.last_poster_username}}</a></span>
        <br />
        <a href={{@topic.lastPostUrl}}>
          {{formatDate @topic.bumpedAt format="tiny"}}
        </a>
      </div>
    </td>
  </template>
}