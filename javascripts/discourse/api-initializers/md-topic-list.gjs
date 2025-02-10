import { apiInitializer } from "discourse/lib/api";

const LastPostCol = <template>
  <th>Staff?</th>
</template>;
const LastPostCell = <template>
  <td class="last-post">
    <div class='poster-avatar'>
      <a href="{{topic.lastPostUrl}}" data-user-card="{{topic.last_poster_username}}">{{avatar topic.lastPosterUser imageSize="medium"}}</a>
    </div>
    <div class='poster-info'>
      <span class='editor'><a href="/users/{{topic.last_poster_username}}" data-auto-route="true" data-user-card="{{topic.last_poster_username}}">{{topic.last_poster_username}}</a></span>
      <br />
      <a href="{{topic.lastPostUrl}}">{{format-date topic.bumpedAt format="tiny"}}</a>
    </div>
  </td>
</template>;

export default apiInitializer("1.8.0", (api) => {
  const discoveryService = api.container.lookup("service:discovery");

  api.registerValueTransformer("topic-list-columns", ({ value: columns }) => {
    columns.delete("posters");
	columns.delete("activity");

    columns.add("last-post", {
        header: LastPostCell,
        item: LastPostCell,
      });
    }

    return columns;
  });
});