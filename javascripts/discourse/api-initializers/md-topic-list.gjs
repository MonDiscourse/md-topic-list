import { apiInitializer } from "discourse/lib/api";
import Component from "@glimmer/component";
import { hash } from "@ember/helper";
import { on } from "@ember/modifier";
import { action } from "@ember/object";
import { service } from "@ember/service";
import PluginOutlet from "discourse/components/plugin-outlet";
import ActionList from "discourse/components/topic-list/action-list";
import ParticipantGroups from "discourse/components/topic-list/participant-groups";
import TopicExcerpt from "discourse/components/topic-list/topic-excerpt";
import TopicLink from "discourse/components/topic-list/topic-link";
import UnreadIndicator from "discourse/components/topic-list/unread-indicator";
import TopicPostBadges from "discourse/components/topic-post-badges";
import TopicStatus from "discourse/components/topic-status";
import categoryLink from "discourse/helpers/category-link";
import discourseTags from "discourse/helpers/discourse-tags";
import topicFeaturedLink from "discourse/helpers/topic-featured-link";
import { groupPath } from "discourse/lib/url";
import { i18n } from "discourse-i18n";

const lastpostHeaderCell = <template>
  <th>Activity</th>
</template>;
const lastpostItemCell = <template>
  <td class="last-post">
    <div class="poster-avatar">
      <a
                    href={{@topic.lastPostUrl}}
                    aria-label={{i18n
                      "latest_poster_link"
                      username=@topic.lastPosterUser.username
                    }}
                    data-user-card={{@topic.lastPosterUser.username}}
                  >{{avatar @topic.lastPosterUser imageSize="large"}}</a>
    </div>
    test
  </td>
</template>;

export default apiInitializer("1.34", (api) => {
  const discoveryService = api.container.lookup("service:discovery");

  api.registerValueTransformer("topic-list-columns", ({ value: columns }) => {
    // Remove the core column which shows poster avatars:
    columns.delete("posters");
	columns.delete("activity");

    columns.add("lastpost", {
        header: lastpostHeaderCell,
        item: lastpostItemCell,
    });

    return columns;
  });
});