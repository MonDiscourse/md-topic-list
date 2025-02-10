import { apiInitializer } from "discourse/lib/api";

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