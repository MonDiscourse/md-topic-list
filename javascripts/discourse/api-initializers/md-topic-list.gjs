import { apiInitializer } from "discourse/lib/api";

const StaffHeaderCell = <template>
  <th>Staff?</th>
</template>;
const StaffItemCell = <template>
  <td>{{if @topic.creator.staff "?"}}</td>
</template>;

export default apiInitializer("1.34", (api) => {
  const discoveryService = api.container.lookup("service:discovery");

  api.registerValueTransformer("topic-list-columns", ({ value: columns }) => {
    // Remove the core column which shows poster avatars:
    columns.delete("posters");

    columns.add("test", {
        header: StaffHeaderCell,
        item: StaffItemCell,
    });

    return columns;
  });
});