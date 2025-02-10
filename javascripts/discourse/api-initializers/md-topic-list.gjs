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

    // Swap the "replies" and "views" columns:
    columns.reposition("views", { before: "replies" });

    // Lean on external autotracked state to make decisions:
    if (discoveryService.category?.slug === "announcements") {
      // Add a custom column:
      columns.add("created-by-staff", {
        header: StaffHeaderCell,
        item: StaffItemCell,
      });
    }

    return columns;
  });
});