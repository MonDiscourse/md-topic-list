import { apiInitializer } from "discourse/lib/api";

const lastpostHeaderCell = <template>
  <th>Activity</th>
</template>;
const lastpostItemCell = <template>
  <td class="last-post">
    <div class="poster-avatar">
      <a href="{{topic.lastPostUrl}}" data-user-card="{{topic.last_poster_username}}">{{avatar topic.lastPosterUser imageSize="medium"}}</a>
    </div>
    <div class="poster-info">
      <span class="editor"><a href="/users/{{topic.last_poster_username}}" data-auto-route="true" data-user-card="{{topic.last_poster_username}}">{{topic.last_poster_username}}</a></span>
      <br />
      <a href="{{topic.lastPostUrl}}">{{format-date topic.bumpedAt format="tiny"}}</a>
    </div>
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